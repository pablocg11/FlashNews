
import Foundation

protocol GetMoreNewsUseCaseType {
    func execute(category: Categories) async -> Result<[Article], DomainError>
}

class GetMoreNewsUseCase: GetMoreNewsUseCaseType {
    
    let repository: NewsRepositoryType
    
    init(repository: NewsRepositoryType) {
        self.repository = repository
    }
    
    func execute(category: Categories) async -> Result<[Article], DomainError> {
        return await repository.getMoreNews(category: category)
    }
}
