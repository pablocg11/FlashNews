
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
                    .opacity(0.5)
            } placeholder: {
                    ProgressView()
                }
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(article.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .frame(maxWidth: 170)
                
                HStack {
                    Image(systemName: "clock.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 10,maxHeight: 10)
                    
                    Text("\(article.publishedAt)")
                        .font(.caption)
                        .fontWeight(.semibold)
                }
            }
            .padding()
            .multilineTextAlignment(.leading)
            .foregroundColor(.primary)
        }
        .frame(width: 180, height: 100)
        .background(Color.white)
        .cornerRadius(10)
    }
}
