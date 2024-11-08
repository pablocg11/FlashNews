
import Foundation

class PresentationErrorMapper {
    func map(error: DomainError?) -> String {
        switch error {
        case .tooManyRequest:
            return "Too many requests. Please try again later."
        case .emptyResponse:
            return "No data available. Please try again."
        case .networkError:
            return "Network connection is lost. Please check your internet connection."
        case .timeout:
            return "The request timed out. Please try again."
        case .serverError:
            return "Server error. Please try again later."
        case .clientError:
            return "Client error. Please check your request and try again."
        case .parsingError:
            return "There was an error parsing the data. Please try again."
        case .invalidResponse:
            return "Received an invalid response from the server. Please try again."
        case .generic(let message):
            return message.isEmpty ? "An unknown error occurred." : message  
        default:
            return "Something went wrong. Please try again."
        }
    }
}
