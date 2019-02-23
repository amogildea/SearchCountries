import Foundation

enum RestCountriesError: Error {
    case requestFailed
    case responseUnsuccessful(statusCode: Int)
    case invalidData
    case jsonParsingFailure
    case invalidUrl
}
