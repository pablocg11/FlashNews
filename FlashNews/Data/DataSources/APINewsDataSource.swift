
import Foundation
import Combine

protocol APINewsDataSourceProtocol {
    func getNews() async -> Result<[ArticleDTO], HTTPClientError>
    func getMoreNews() async -> Result<[ArticleDTO], HTTPClientError>
}

class APINewsDataSource: APINewsDataSourceProtocol {
    
    private let httpClient: HTTPClientProtocol
    private let APIKeyManager: APIKeyManager
    private let baseUrl = "https://newsapi.org/v2/top-headlines"
    private var currentPage: Int = 1
        
    init(httpClient: HTTPClientProtocol) {
        self.httpClient = httpClient
    }
    
    func getNews() async -> Result<[ArticleDTO], HTTPClientError> {
        guard let apiKey = APIKeyManager.getAPIKey() else { return .failure(.clientError)}
        
        let params: [String: Any] = [
            "apiKey":   apiKey,
            "page"  :   currentPage
        ]
        
        let request = HTTPRequest(baseURL: baseUrl, method: .get, params: params)
        
        let result = await httpClient.makeRequest(request)
        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }
        
        guard let newsResponse = try? JSONDecoder().decode(NewsReponseDTO.self, from: data) else {
            return .failure(.parsingError)
        }
        
        if newsResponse.articles.isEmpty {
            return .failure(.badURL)
        }
        
        return .success(newsResponse.articles)
    }
    
    func getMoreNews() -> Result<[ArticleDTO], HTTPClientError> {
        
    }
    
    
    private func handleError(error: HTTPClientError?) -> HTTPClientError {
        guard let error = error else { return .generic }
        return error
    }
    
    
}
