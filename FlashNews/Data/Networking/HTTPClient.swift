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
        
        return await performRequest(url)
    }

    private func performRequest(_ url: URL) async -> Result<Data, HTTPClientError> {
        do {
            let result = try await session.data(from: url)
            return handleHTTPResponse(result.1, data: result.0)
        } catch let error as URLError {
            return handleNetworkError(error)
        } catch {
            return .failure(errorsResolver.resolve(error: error))
        }
    }
    
    private func handleHTTPResponse(_ response: URLResponse?, data: Data) -> Result<Data, HTTPClientError> {
        guard let httpResponse = response as? HTTPURLResponse else {
            return .failure(.invalidResponse)
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            return .success(data)
        case 400...499:
            return .failure(.clientError)
        case 500...599:
            return .failure(.serverError)
        default:
            return .failure(.serverError)
        }
    }
    
    private func handleNetworkError(_ error: URLError) -> Result<Data, HTTPClientError> {
        switch error.code {
        case .notConnectedToInternet, .networkConnectionLost:
            return .failure(.networkError)
        case .timedOut:
            return .failure(.timeout)
        default:
            return .failure(.networkError)
        }
    }
}
