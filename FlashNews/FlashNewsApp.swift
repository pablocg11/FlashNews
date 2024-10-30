
import SwiftUI

@main
struct FlashNewsApp: App {
    var body: some Scene {
        WindowGroup {
            MainContentView(newsListView: NewsListViewFactory().createView())
        }
    }
}
