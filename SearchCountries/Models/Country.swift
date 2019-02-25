import Foundation

struct Country: Codable {
    let name: String
    let capital: String
    let flag: String
    let subregion: String
    let population: Int
    let languages: [Languages]
    
//    var countryName: String {
//        return self.name
//    }
    init(name: String, capital: String, flag: String, subregion: String, population: Int, languages: [Languages]) {
        self.name = name
        self.capital = capital
        self.flag = flag
        self.subregion = subregion
        self.population = population
        self.languages = languages
    }
}
