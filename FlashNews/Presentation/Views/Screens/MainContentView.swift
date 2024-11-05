
import SwiftUI

struct MainContentView: View {
    @ObservedObject var vm: NewsListViewModel
    @State private var searchText: String = ""
    @State private var selectedCategory: Categories = .general
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
            } else {
                VStack {
                    CategoryListView(selectedCategory: $selectedCategory)
                    
                    if vm.isLoading {
                        LoadingView()
                    } else {
                        NewsListView(vm: vm,selectedCategory: selectedCategory)
                            .padding(.bottom, 5)
                            .ignoresSafeArea(edges: .bottom)
                    }
                }
                .navigationTitle("Latest News")
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            }
        }
        .onAppear {
            vm.onAppear()
        }
        .onChange(of: selectedCategory) { category in
            vm.fetchNews(category: category)
        }
    }
}
