
import SwiftUI

struct NewsItemView: View {
    private var article: Article
    
    init(article: Article) {
        self.article = article
    }
    
    var body: some View {
        ZStack {
            if let urlToImage = article.urlToImage, let url = URL(string: urlToImage) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(10)
                        .opacity(0.7)
                        .overlay(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.black.opacity(0), Color.black]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                } placeholder: {
                    ProgressView()
                }
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .cornerRadius(10)
            }
                        
            VStack(alignment: .leading, spacing: 5) {
                Spacer()
                
                Text(article.title)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .truncationMode(.tail)
                
                Text("\(article.publishedAt)")
                    .font(.caption2)
                    .fontWeight(.light)
            }
            .padding()
            .frame(width: 175, height: 135)
            .multilineTextAlignment(.leading)
            .foregroundColor(.white)
        }
        .frame(width: 180, height: 140)
        .background(Color.white)
        .cornerRadius(10)
    }
}
