
import Foundation
@testable import FlashNews

class APINewsDataSourceStub: APINewsDataSourceProtocol {
    private let articles: Result<[ArticleDTO], HTTPClientError>
    
    init(articles: Result<[ArticleDTO], HTTPClientError>) {
        self.articles = articles
    }
    
    func getNews(category: Categories) async -> Result<[ArticleDTO], HTTPClientError> {
        return articles
    }
}
