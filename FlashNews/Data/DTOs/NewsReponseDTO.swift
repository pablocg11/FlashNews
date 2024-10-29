
import Foundation

struct NewsReponseDTO: Codable {
    let status: String
    let totalResults: Int
    let articles: [ArticleDTO]
}
