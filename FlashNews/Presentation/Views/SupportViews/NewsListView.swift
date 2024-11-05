
import SwiftUI

struct NewsListView: View {
    
    @ObservedObject var vm: NewsListViewModel
    @State var searchText: String = ""
    @State var selectedCategory: Categories
    let columns = [
        GridItem(.flexible(minimum: 180, maximum: 180)),
        GridItem(.flexible(minimum: 180, maximum: 180)),
    ]
    
    var body: some View {
        VStack {
            if vm.news.isEmpty {
                Spacer()
                EmptyNewsListView(selectedCategory: $selectedCategory)
                Spacer()
            }
            else {
                let filteredNews = searchText.isEmpty ? vm.news : vm.news.filter { $0.title.localizedCaseInsensitiveContains(searchText) }

                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(filteredNews, id: \.self) { article in
                            NavigationLink(destination: DetailArticleView(article: article)) {
                                NewsItemView(article: article)
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}
