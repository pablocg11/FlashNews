
import Foundation
import SwiftUI

struct LoadingView: View {
    var body: some View {
        GeometryReader { geometryReader in
            ZStack {
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(3.0, anchor: .center)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .tint(.primary.opacity(0.5))
                    .position(x: geometryReader.size.width/2, y: geometryReader.size.height/2)
            }
        }
        .ignoresSafeArea()
    }
}
