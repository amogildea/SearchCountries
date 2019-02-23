import Foundation

struct Country: Codable {
    let name: String
    let capital: String
    let flag: String
    let subregion: String
    let population: Int
//    let language: Language
    
//    var countryName: String {
//        return self.name
//    }
    init(name: String, capital: String, flag: String, subregion: String, population: Int) {
        self.name = name
        self.capital = capital
        self.flag = flag
        self.subregion = subregion
        self.population = population
//        self.language = language
    }
}
