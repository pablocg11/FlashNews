
import SwiftUI

@main
struct FlashNewsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(newsListViewFactory: NewsListViewFactory())
        }
    }
}
