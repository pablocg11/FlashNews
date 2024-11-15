
import Foundation

struct HTTPRequest {
    let baseURL: String
    let params: [String: Any]?
    let method: HTTPMethod
}
