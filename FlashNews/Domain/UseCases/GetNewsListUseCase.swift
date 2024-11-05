
import Foundation

protocol GetNewsListUseCaseType {
    func execute(category: Categories) async -> Result<[Article], DomainError>
}

class GetNewsListUseCase: GetNewsListUseCaseType {
    
    private let repository: NewsRepositoryType
    
    init(repository: NewsRepositoryType) {
        self.repository = repository
    }
    
    func execute(category: Categories) async -> Result<[Article], DomainError> {
        return await repository.getAllNews(category: category)
    }
}
