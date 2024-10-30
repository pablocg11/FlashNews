import Foundation

class DomainErrorMapper {
    func map(error: HTTPClientError?) -> DomainError {
        guard let error = error else {
            return .generic("An unknown error occurred.")
        }
        
        switch error {
        case .tooManyRequest:
            return .tooManyRequest
        case .parsingError:
            return .generic("Failed to parse the response data.")
        case .badURL:
            return .generic("The requested URL is invalid.")
        case .clientError:
            return .generic("A client error occurred. Please try again.")
        case .serverError:
            return .generic("A server error occurred. Please try later.")
        case .networkError:
            return .generic("A network issue occurred. Check your connection.")
        default:
            return .generic("An unexpected error occurred.")
        }
    }
}
