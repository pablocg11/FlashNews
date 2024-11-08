
import Foundation

enum HTTPClientError: Error {
    case generic
    case tooManyRequest
    case invalidResponse
    case parsingError
    case badURL
    case clientError
    case serverError
    case networkError
    case timeout
}
