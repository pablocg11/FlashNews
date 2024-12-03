
import SwiftUI

struct CategoryButton: View {
    
    var category: String
    @Binding var isSelected: Bool
    
    var body: some View {
        
        Button(action: {
            withAnimation {
                isSelected.toggle()
            }
        }, label: {
            Text(category)
                .font(.caption)
                .fontWeight(isSelected ? .bold : .regular)
                .padding(10)
        })
        .background(isSelected ? Color.blue : Color.secondary.opacity(0.5))
        .foregroundColor(isSelected ? Color.white : Color.black)
        .cornerRadius(20)
    }
}
