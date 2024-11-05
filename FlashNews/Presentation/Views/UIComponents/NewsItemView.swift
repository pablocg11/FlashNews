
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
                        .clipped()
                        .cornerRadius(10)
                } placeholder: {
                    ProgressView()
                        .frame(width: 80)
                }
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 80, height: 80)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(article.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .truncationMode(.tail)
                
                HStack {
                    Image(systemName: "clock.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 10,maxHeight: 10)
                    
                    Text("\(article.publishedAt)")
                        .font(.caption)
                        .fontWeight(.light)
                }
                .foregroundColor(.gray)

                Text(article.description ?? "Description not available")
                    .font(.caption)
                    .fontWeight(.light)
                    .lineLimit(3)
                    .truncationMode(.tail)
            }
            .padding(.leading, 10)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}
