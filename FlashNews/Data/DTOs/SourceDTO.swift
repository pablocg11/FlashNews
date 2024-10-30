
import Foundation

struct SourceDTO: Codable, Identifiable {
    let id: String?
    let name: String
    
    init(id: String?, name: String) {
        self.id = id
        self.name = name
    }
}
