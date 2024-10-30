
import Foundation

protocol GetNewsListUseCaseType {
    func execute() async -> Result<[Article], DomainError>
}

class GetNewsListUseCase: GetNewsListUseCaseType {
    
    private let repository: NewsRepositoryType
    
    init(repository: NewsRepositoryType) {
        self.repository = repository
    }
    
    func execute() async -> Result<[Article], DomainError> {
        return await repository.getAllNews()
    }
}
