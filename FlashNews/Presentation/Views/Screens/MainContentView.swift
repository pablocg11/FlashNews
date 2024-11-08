
import SwiftUI

struct MainContentView: View {
    @ObservedObject var vm: NewsListViewModel
    @State private var selectedCategory: Categories = .general
    @State private var searchText: String = ""
    @Namespace private var myNamespace
    
    let columns = [
        GridItem(.flexible(minimum: 180, maximum: 180)),
        GridItem(.flexible(minimum: 180, maximum: 180)),
    ]
    
    init(vm: NewsListViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        NavigationStack {
            if let errorMessage = vm.errorMessage {
                ErrorView(text: errorMessage, action: vm.onAppear)
                    .accessibilityIdentifier("ErrorView")
            } else {
                VStack {
                    CategoryListView(selectedCategory: $selectedCategory)
                        .accessibilityIdentifier("CategoryListView")
                    
                    if vm.isLoading {
                        LoadingView()
                            .accessibilityIdentifier("LoadingView")
                    } else {
                        let filteredNews = searchText.isEmpty ? vm.news : vm.news.filter {
                            $0.title.localizedCaseInsensitiveContains(searchText)
                        }
                        
                        if filteredNews.isEmpty {
                            Spacer()
                            EmptyNewsListView(selectedCategory: selectedCategory)
                                .accessibilityIdentifier("EmptyNewsListView")
                            Spacer()
                        } else {
                            ScrollView {
                                LazyVGrid(columns: columns, spacing: 20) {
                                    ForEach(filteredNews, id: \.self) { article in
                                        NavigationLink {
                                            DetailArticleView(article: article)
                                                .navigationTransition(.zoom(sourceID: article, in: myNamespace))
                                        } label: {
                                            NewsItemView(article: article)
                                                .accessibilityIdentifier("NewsItemView_\(article.title)")
                                        }
                                        .matchedTransitionSource(id: article
                                                                 ,in: myNamespace)
                                    }
                                }
                            }
                            .refreshable {
                                vm.onAppear()
                            }
                            .scrollIndicators(.hidden)
                            .padding()
                            .padding(.bottom, 5)
                            .ignoresSafeArea(edges: .bottom)
                        }
                    }
                }
                .navigationTitle("Latest News")
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                .accessibilityIdentifier("MainContentView")
            }
        }
        .onAppear {
            vm.onAppear()
        }
        .onChange(of: selectedCategory) {
            vm.fetchNews(category: selectedCategory)
        }
    }
}
