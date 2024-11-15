
import Foundation
@testable import FlashNews

class NewsRepositoryStub: NewsRepositoryType {
    private let result: Result<[Article], DomainError>
    
    init(result: Result<[Article], DomainError>) {
        self.result = result
    }
    
    func getAllNews(category: Categories) async -> Result<[Article], DomainError> {
        self.result
    }
    
    func getMoreNews(category: Categories) async -> Result<[Article], DomainError> {
        self.result
    }
}
