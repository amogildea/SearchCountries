import Foundation

struct Stub {
    static var country: Country {
//        return Country(name: "France", capital: "Paris", flagUrl: "https://restcountries.eu/data/fra.svg", subregion: "Western Europe", population: 66710000, language:Language(name: "French", nativeName: "français"))
         return Country(name: "France", capital: "Paris", flag: "https://restcountries.eu/data/fra.svg", subregion: "Western Europe", population: 66710000)
    }
}
