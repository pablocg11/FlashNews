
import Foundation

class APIKeyManager {
    
    func getAPIKey() -> String? {
        guard let path = Bundle.main.path(forResource: "config", ofType: "plist"),
              let config = NSDictionary(contentsOfFile: path),
              let apiKey = config["API_KEY"] as? String else {
            print("Error al cargar la clave API desde config.plist")
            return nil
        }
        
        return apiKey
    }
}
