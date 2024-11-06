
import SwiftUI

struct CategoryListView: View {
    @Binding var selectedCategory: Categories
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(Categories.allCases, id: \.self) { category in
                    Button(action: {
                        selectedCategory = category
                    }) {
                        CategoryButton(category: category.rawValue, isSelected: Binding(
                            get: { selectedCategory == category },
                            set: { isSelected in
                                selectedCategory = isSelected ? category : .general
                            }
                        ))
                    }
                }
            }
        }
        .scrollClipDisabled()
        .padding(.horizontal)
    }
}
