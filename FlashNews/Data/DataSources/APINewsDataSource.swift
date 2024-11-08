
import Foundation

protocol APINewsDataSourceProtocol {
    func getNews(category: Categories) async -> Result<[ArticleDTO], HTTPClientError>
    func getMoreNews(category: Categories) async -> Result<[ArticleDTO], HTTPClientError>
}

class APINewsDataSource: APINewsDataSourceProtocol {
    
    private let httpClient: HTTPClientProtocol
    private let APIKeyManager: APIKeyManager
    private let baseUrl = "https://newsapi.org/v2/top-headlines"
    private var currentPage: Int = 1
        
    init(httpClient: HTTPClientProtocol, APIKeyManager: APIKeyManager) {
        self.httpClient = httpClient
        self.APIKeyManager = APIKeyManager
    }
    
    func getNews(category: Categories) async -> Result<[ArticleDTO], HTTPClientError> {
        guard let apiKey = APIKeyManager.getAPIKey() else { return .failure(.clientError)}
        
        let params: [String: Any] = [
            "apiKey"    :   apiKey,
            "country"   :   "us",
            "page"      :   currentPage,
            "category"  :   category
        ]
        
        let request = HTTPRequest(baseURL: baseUrl, method: .get, params: params)
        let result = await httpClient.makeRequest(request)
        
        switch result {
        case .success(let data):
            do {
                let newsResponse = try JSONDecoder().decode(NewsReponseDTO.self, from: data)
                return .success(newsResponse.articles)
            } catch {
                return .failure(.parsingError)
            }
            
        case .failure(let error):
            return .failure(handleError(error: error))
        }
    }
    
    func getMoreNews(category: Categories) async -> Result<[ArticleDTO], HTTPClientError> {
        currentPage += 1
        return await getNews(category: category)
    }
    
    private func handleError(error: HTTPClientError?) -> HTTPClientError {
        guard let error = error else { return .generic }
        return error
    }
}
