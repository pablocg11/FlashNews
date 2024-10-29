
import Foundation

struct ArticleDTO: Codable {
    let source: SourceDTO
    let author: String?
    let title, articleDescription: String
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String?
}
