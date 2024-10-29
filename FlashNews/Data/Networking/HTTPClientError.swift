
import Foundation

enum HTTPClientError: Error {
    case clientError
    case serverError
    case generic
    case parsingError
    case badURL
    case responseError
}
