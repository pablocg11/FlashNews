
import Foundation

struct HTTPRequest {
    let baseURL: String
    let params: [String: Any]?
    let method: HTTPMethod
    
    init(baseURL: String, method: HTTPMethod, params: [String : Any]? = nil) {
        self.baseURL = baseURL
        self.params = params
        self.method = method
    }
}
