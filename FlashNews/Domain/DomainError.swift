
import Foundation

enum DomainError: Error, Equatable {
    case networkError
    case timeout
    case serverError
    case clientError
    case parsingError
    case emptyResponse
    case invalidResponse
    case tooManyRequest
    case generic(String)
}
