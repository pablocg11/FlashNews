
import Foundation

protocol NewsRepositoryType {
    func getAllNews() async -> Result<[Article], DomainError>
    func getMoreNews() async -> Result<[Article], DomainError>
}

class NewsRepository: NewsRepositoryType {
    
    private let apiDataSource: APINewsDataSourceProtocol
    private let errorMapper: DomainErrorMapper
    
    init(apiDataSource: APINewsDataSourceProtocol, errorMapper: DomainErrorMapper) {
        self.apiDataSource = apiDataSource
        self.errorMapper = errorMapper
    }
    
    func getAllNews() async -> Result<[Article], DomainError> {
        let result = await apiDataSource.getNews()
        
        switch result {
        case .success(let articles):
            let articlesListDomain = convertToArticles(from: articles)
            return .success(articlesListDomain)
        case .failure(let error):
            return .failure(errorMapper.map(error: error))
        }
    }
    
    func getMoreNews() async -> Result<[Article], DomainError> {
        let result = await apiDataSource.getMoreNews()
                
        switch result {
        case .success(let articles):
            let articlesListDomain = articles.map { Article(dto: $0) }
            return .success(articlesListDomain)
        case .failure(let error):
            return .failure(errorMapper.map(error: error))
        }
    }
    
    func convertToArticles(from dtos: [ArticleDTO]) -> [Article] {
        return dtos.compactMap { dto -> Article? in
            guard dto.title != "[Removed]" else {
                return nil 
            }
            return Article(dto: dto)
        }
    }
}
