
import Foundation

enum HTTPClientError: Error {
    case clientError
    case serverError
    case networkError
    case generic
    case parsingError
    case tooManyRequest
    case badURL
    case responseError
}
