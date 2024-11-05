
import Foundation
import SwiftUI

struct ErrorView: View {
    let text: String
    let action: () -> Void
    
    init(text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }
    
    var body: some View {
        VStack {
            Button(action: action) {
                Label(text, systemImage: "person.crop.circle.badge.exclamationmark.fill")
                    .padding(12)
                    .foregroundColor(.white)
                    .background(.red,
                                in: RoundedRectangle(cornerRadius: 12))
            }
        }
    }
}
