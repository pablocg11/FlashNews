
import SwiftUI

struct ContentView: View {
    var newsListViewFactory: NewsListViewFactory
    
    var body: some View {
        newsListViewFactory.createView()
            .accessibilityIdentifier("MainContentView")
    }
}


