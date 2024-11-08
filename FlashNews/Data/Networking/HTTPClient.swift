
import Foundation
import Combine

protocol HTTPClientProtocol {
    func makeRequest(_ request: HTTPRequest) async -> Result<Data, HTTPClientError>
}

class HTTPClient: HTTPClientProtocol {
    
    let session: URLSession
    let errorsResolver: HTTPErrorsResolver
    let requestBuilder: HTTPRequestBuilder
    
    init(session: URLSession = .shared,
         errorsResolver: HTTPErrorsResolver,
         requestBuilder: HTTPRequestBuilder) {
        self.session = session
        self.errorsResolver = errorsResolver
        self.requestBuilder = requestBuilder
    }
        
    func makeRequest(_ request: HTTPRequest) async -> Result<Data, HTTPClientError> {
        guard let url = requestBuilder.url(request: request) else {
            return .failure(.badURL)
        }
        
        do {
            let result = try await session.data(from: url)
            
            guard let response = result.1 as? HTTPURLResponse else {
                return .failure(.invalidResponse)
            }
            
            switch response.statusCode {
            case 200...299:
                return .success(result.0)
            case 400...499:
                return .failure(.clientError)
            case 500...599:
                return .failure(.serverError)
            default:
                return .failure(.serverError)
            }
            
        } catch let error as URLError {
            switch error.code {
            case .notConnectedToInternet, .networkConnectionLost:
                return .failure(.networkError)
            case .timedOut:
                return .failure(.timeout)
            default:
                return .failure(.networkError)
            }
        } catch {
            return .failure(errorsResolver.resolve(error: error))
        }
    }
}
