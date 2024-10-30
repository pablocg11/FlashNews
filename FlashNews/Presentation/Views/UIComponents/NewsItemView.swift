
import SwiftUI

struct NewsItemView: View {
    
    private var article: Article
    
    init(article: Article) {
        self.article = article
    }
    
    var body: some View {
        HStack(spacing: 10) {
            if let urlToImage = article.urlToImage, let url = URL(string: urlToImage) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .cornerRadius(10)
                        .clipped()
                } placeholder: {
                    ProgressView()
                        .frame(width: 80, height: 80)
                }
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 80, height: 80)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .truncationMode(.tail)
                
                Text(article.description ?? "Descripción no disponible")
                    .font(.caption)
                    .fontWeight(.light)
                    .lineLimit(3)
                    .truncationMode(.tail)
            }
            .padding(.leading, 10)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 2)
    }
}
