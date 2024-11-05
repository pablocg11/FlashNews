
import SwiftUI

struct EmptyNewsListView: View {
    
    @Binding var selectedCategory: Categories
    
    var body: some View {
        VStack {
            Image(systemName: "newspaper.fill")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 80, maxHeight: 80)
            Text("No news found in \(self.selectedCategory)")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
        }
        .foregroundColor(.gray)
    }
}

 
