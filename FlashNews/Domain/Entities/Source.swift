
import Foundation

struct Source: Equatable, Hashable {
    let id: String?
    let name: String
    
    init(id: String?, name: String) {
        self.id = id
        self.name = name
    }
    
    init(dto: SourceDTO) {
        self.id = dto.id
        self.name = dto.name
    }
}
