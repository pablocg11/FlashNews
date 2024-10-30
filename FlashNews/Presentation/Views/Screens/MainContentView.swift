
import SwiftUI

struct MainContentView: View {
    
    private let newsListView: NewsListView
    
    init(newsListView: NewsListView) {
        self.newsListView = newsListView
    }
    
    var body: some View {
        newsListView
    }
}
