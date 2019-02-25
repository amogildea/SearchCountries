import Foundation
import UIKit

struct CountryCellViewModel {
    let name: String
    let flag: String
    let capital: String
    let population: Int
    let subregion: String
    let languages: [Languages]
}

extension CountryCellViewModel {
    init(country: Country) {
        self.name = country.name
        self.flag = country.flag
        self.capital = country.capital
        self.population = country.population
        self.subregion = country.subregion
        self.languages = country.languages
    }
}
