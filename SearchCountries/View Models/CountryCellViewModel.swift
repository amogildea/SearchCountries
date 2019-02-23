import Foundation

struct CountryCellViewModel {
    let name: String
    let flag: String
    let capital: String
    let population: Int
    let subregion: String
//    let language: Language
}

extension CountryCellViewModel {
    init(country: Country) {
        self.name = country.name
        self.flag = country.flag
        self.capital = country.capital
        self.population = country.population
        self.subregion = country.subregion
//        self.language = country.language
    }
}
