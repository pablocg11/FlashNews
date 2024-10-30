
import Foundation

enum DomainError: Error {
    case generic(String)
    case emptyResponse
    case tooManyRequest
}
