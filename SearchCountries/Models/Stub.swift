import Foundation
import UIKit

struct Stub {
    static var country: Country {
        return Country(name: "France", capital: "Paris", flag: "https://restcountries.eu/data/fra.svg", subregion: "Western Europe", population: 66710000, languages:[Languages(name: "French", nativeName: "français")])
//         return Country(name: "France", capital: "Paris", flag: "https://restcountries.eu/data/fra.svg", subregion: "Western Europe", population: 66710000)
    }
}
