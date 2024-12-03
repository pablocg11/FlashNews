
import SwiftUI
import Lottie

struct EmptyNewsListView: View {
    @State var selectedCategory: Categories
    
    var body: some View {
        ContentUnavailableView {
            LottieView(animation: .named("empty-content-animation.json"))
                .configure(\.contentMode, to: .scaleAspectFit)
                .playing(loopMode: .playOnce)
                .animationSpeed(0.4)
                .frame(maxWidth: 500, maxHeight: 300)
                .padding(-10)
        } description: {
            Text("No news found in \(self.selectedCategory) category")
                .font(.headline)
                .multilineTextAlignment(.center)
        }
        .foregroundColor(.secondary)
        .padding()
    }
}
