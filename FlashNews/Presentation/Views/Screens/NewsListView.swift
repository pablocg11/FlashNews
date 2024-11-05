
import SwiftUI

struct NewsListView: View {
    @ObservedObject var vm: NewsListViewModel
    @State private var searchText: String = ""
    @State private var selectedCategory: Categories = .general
    
    init(vm: NewsListViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        NavigationStack {
            if let errorMessage = vm.errorMessage {
                ErrorView(text: errorMessage, action: vm.onAppear)
            } else {
                VStack {
                    categoryScrollView
                    
                    if vm.isLoading {
                        LoadingView()
                    } else {
                        newsScrollView
                    }
                }
                .navigationTitle("Today's News")
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                .ignoresSafeArea(edges: .bottom)
            }
        }
        .onAppear {
            vm.onAppear()
        }
        .onChange(of: selectedCategory) { category in
            vm.fetchNews(category: category)
        }
    }
    
    private var categoryScrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(Categories.allCases, id: \.self) { category in
                    Button(action: {
                        selectedCategory = category 
                    }) {
                        CategoryButton(category: category.rawValue, isSelected: Binding(
                            get: { selectedCategory == category },
                            set: { isSelected in
                               selectedCategory = isSelected ? category : .general
                            }
                        ))
                    }
                }
            }
        }
        .padding(.horizontal)
    }
    
    private var newsScrollView: some View {
        VStack {
            if vm.news.isEmpty {
                
                Spacer()
                emptyView
                Spacer()
            }
            else {
                ScrollView {
                    let filteredNews = searchText.isEmpty ? vm.news : vm.news.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
                    ForEach(filteredNews, id: \.self) { article in
                        NavigationLink(destination: DetailArticleView(article: article)) {
                            NewsItemView(article: article)
                        }
                        Divider()
                    }
                }
                .padding(.vertical)
            }
        }
    }
    
    private var emptyView: some View {
        VStack {
            Image(systemName: "newspaper.fill")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 80, maxHeight: 80)
            Text("No news found in \(self.selectedCategory)")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
        }
        .foregroundColor(.gray)
    }
}
