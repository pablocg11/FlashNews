
import Foundation

protocol APINewsDataSourceProtocol {
    func getNews(category: Categories) async -> Result<[ArticleDTO], HTTPClientError>
}

class APINewsDataSource: APINewsDataSourceProtocol {
    
    private let httpClient: HTTPClientProtocol
    private let baseUrl = "https://newsapi.org/v2/top-headlines"
        
    init(httpClient: HTTPClientProtocol) {
        self.httpClient = httpClient
    }
    
    func getNews(category: Categories) async -> Result<[ArticleDTO], HTTPClientError> {
        guard let apiKey = ProcessInfo.processInfo.environment["NEWS_API_KEY"] else {
            fatalError("No se pudo cargar la configuración de la API.")
        }
        
        let params: [String: Any] = [
            "apiKey": apiKey,
            "country": "us",
            "category": category
        ]
        
        let request = HTTPRequest(baseURL: baseUrl, params: params, method: .get)
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

    private func handleError(error: HTTPClientError?) -> HTTPClientError {
        guard let error = error else { return .generic }
        return error
    }
}
