import Foundation

class DataManager {
    func parseJSON(data: Data) -> Resume? {
        return try? JSONDecoder().decode(Resume.self, from: data)
    }
}
