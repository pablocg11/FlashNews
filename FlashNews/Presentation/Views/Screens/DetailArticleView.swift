import SwiftUI

struct DetailArticleView: View {
    
    private let article: Article
    
    init(article: Article) {
        self.article = article
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                if let urlToImage = article.urlToImage, let url = URL(string: urlToImage) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .clipped()
                            .cornerRadius(10)
                    } placeholder: {
                        ProgressView()
                            .frame(maxWidth: .infinity)
                    }
                    .frame(minHeight: 200)
                    .padding(.bottom)
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(maxWidth: .infinity)
                        .frame(minHeight: 200)
                        .cornerRadius(10)
                        .padding(.bottom)
                }
                
                Text(article.title)
                    .font(.title3)
                    .fontWeight(.bold)
                
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

                
                if let description = article.description {
                    Text(description)
                        .font(.body)
                        .foregroundColor(.primary)
                } else {
                    Text("Description not available.")
                        .font(.body)
                        .foregroundColor(.gray)
                }
            }
            .padding()
        }
    }
}
