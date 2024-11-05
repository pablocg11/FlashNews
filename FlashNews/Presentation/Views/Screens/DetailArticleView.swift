import SwiftUI

struct DetailArticleView: View {
    
    private let article: Article
    @State private var isSharingArticle = false
    
    init(article: Article) {
        self.article = article
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                ZStack(alignment: .bottomTrailing) {
                    if let urlToImage = article.urlToImage, let url = URL(string: urlToImage) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: .infinity, maxHeight: 300)
                                .clipped()
                        } placeholder: {
                            ProgressView()
                                .frame(maxWidth: .infinity, maxHeight: 300)
                        }
                    } else {
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(maxWidth: .infinity, maxHeight: 300)
                    }
                    if let author = article.author, !author.isEmpty {
                        Text("By \(author) from \(article.source.name)")
                            .font(.caption)
                            .padding(6)
                            .background(Color.black.opacity(0.6))
                            .foregroundColor(.white)
                            .cornerRadius(5)
                            .padding(10)
                    }
                }
                
                Text(article.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.horizontal)
                
                HStack(spacing: 5) {
                    Image(systemName: "clock.fill")
                        .foregroundColor(.gray)
                    Text("\(article.publishedAt)")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Description")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    if let description = article.description {
                        Text(description)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                    } else {
                        Text("Description not available.")
                            .font(.body)
                            .foregroundColor(.gray)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
                
                if let url = URL(string: article.url) {
                    Link(destination: url) {
                        HStack {
                            Text("Read Full Article")
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right.circle.fill")
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    Button(action: {
                        isSharingArticle = true
                    }) {
                        HStack {
                            Text("Share Article")
                                .fontWeight(.semibold)
                            Image(systemName: "square.and.arrow.up.fill")
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color(UIColor.systemGray6)]), startPoint: .top, endPoint: .bottom)
        .ignoresSafeArea())
        .sheet(isPresented: $isSharingArticle) {
            ShareSheet(activityItems: [article.url])
        }
    }
}