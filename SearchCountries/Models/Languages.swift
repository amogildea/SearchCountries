import Foundation

class Languages: Codable {
    let name: String
    let nativeName: String
    
    init(name: String, nativeName: String) {
        self.name = name
        self.nativeName = nativeName
    }
}
