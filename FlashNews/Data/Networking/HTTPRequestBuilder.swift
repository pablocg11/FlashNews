
import Foundation

class HTTPRequestBuilder {
    func url(request: HTTPRequest) -> URL? {
        var urlComponents = URLComponents(string: request.baseURL)
        let urlQueryParams = request.params?.map({
            URLQueryItem(name: $0.key, value: "\($0.value)")
        })
        urlComponents?.queryItems = urlQueryParams
        return urlComponents?.url
    }
}
