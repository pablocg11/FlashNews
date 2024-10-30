
import Foundation

class PresentationErrorMapper {
    func map(error: DomainError?) -> String {
        switch error {
        case .tooManyRequest:
            return "Too many requests. Please try again later."
        case .emptyResponse:
            return "No data available. Please try again."
        case .generic(let message):
            return message
        default:
            return "Something went wrong. Please try again."
        }
    }
}
