import Foundation

class DomainErrorMapper {
    func map(error: HTTPClientError?) -> DomainError {
        guard let error = error else {
            return .generic("An unknown error occurred.")
        }
        
        switch error {
        case .networkError:
            return .networkError
        case .timeout:
            return .timeout
        case .serverError:
            return .serverError
        case .clientError:
            return .clientError
        case .parsingError:
            return .parsingError
        case .invalidResponse:
            return .invalidResponse
        case .badURL:
            return .generic("Bad URL format.")
        case .tooManyRequest:
            return .generic("Too many requests. Please try again later.")
        case .generic:
            return .generic("An unknown error occurred.")
        }
    }
}
