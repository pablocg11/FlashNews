
import Foundation

protocol NewsRepositoryType {
    func getAllNews(category: Categories) async -> Result<[Article], DomainError>
}

class NewsRepository: NewsRepositoryType {
    
    private let apiDataSource: APINewsDataSourceProtocol
    private let errorMapper: DomainErrorMapper
    
    init(apiDataSource: APINewsDataSourceProtocol, errorMapper: DomainErrorMapper) {
        self.apiDataSource = apiDataSource
        self.errorMapper = errorMapper
    }
    
    func getAllNews(category: Categories) async -> Result<[Article], DomainError> {
        let result = await apiDataSource.getNews(category: category)
        
        switch result {
        case .success(let articles):
            if articles.isEmpty {
                return .failure(.emptyResponse)
            }
            let articlesListDomain = convertToArticles(from: articles)
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
            
            guard dto.urlToImage != nil else {
                return nil
            }
            return Article(dto: dto)
        }
    }
}
