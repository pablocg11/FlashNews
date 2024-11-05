
import Foundation

extension String {
    func timeSincePublication() -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        
        guard let date = formatter.date(from: self) else { return nil }
        
        let timeInterval = Date().timeIntervalSince(date)
        let secondsInMinute: TimeInterval = 60
        let secondsInHour: TimeInterval = 3600
        let secondsInDay: TimeInterval = 86400
        
        if timeInterval < secondsInMinute {
            return "Hace \(Int(timeInterval)) segundos"
        } else if timeInterval < secondsInHour {
            let minutes = Int(timeInterval / secondsInMinute)
            return "Hace \(minutes) minuto\(minutes > 1 ? "s" : "")"
        } else if timeInterval < secondsInDay {
            let hours = Int(timeInterval / secondsInHour)
            return "Hace \(hours) hora\(hours > 1 ? "s" : "")"
        } else {
            let days = Int(timeInterval / secondsInDay)
            return "Hace \(days) día\(days > 1 ? "s" : "")"
        }
    }
}
