import Foundation


class RestCountriesAPIClient {
    
    lazy var baseUrl: URL = {
        return URL(string: "https://restcountries.eu/rest/v2/name/")!
    }()
    
    let decoder = JSONDecoder()
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    typealias CountryCompletionHandler = ([Country]?, Error?) -> Void
    
    public func getCountry(with name: String, completionHandler completion: @escaping CountryCompletionHandler) {
        //        print("url formatted: \(String(describing:URL(string: name, relativeTo:baseUrl)))")
        
        guard let url = URL(string: name, relativeTo: baseUrl) else {
            completion(nil, RestCountriesError.invalidUrl)
            return
        }
        
        let request = URLRequest(url: url)
        print("request:\(request)")
        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        completion(nil, RestCountriesError.requestFailed)
                        return
                    }
                    if httpResponse.statusCode == 200 {
                        do {
                            let country = try self.decoder.decode(Array<Country>.self, from: data)
                            print("country: \(country)")
//                            print(self.decoder.userInfo)
                            completion(country, nil)
//                            let json = try JSONSerialization.jsonObject(with: data, options: []) as? Country
//                            print(json)
//                            completion(json, nil)
                        } catch let error {
                            print(error)
                            completion(nil, error)
                        }
                    } else {
                        completion(nil, RestCountriesError.invalidData)
                    }
                } else if let error = error {
                     print(error)
                    completion(nil, error)
                }
            }
        }
        
        task.resume()
    }
}
