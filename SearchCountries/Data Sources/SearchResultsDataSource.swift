import Foundation
import UIKit

class SearchResultsDataSource: NSObject, UITableViewDataSource {
    
    private var dataCountry = [Country]()
    
    func update(with countries: [Country]) {
        dataCountry = countries
    }
    
    // MARK: - Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCountry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsCell", for:indexPath)
        let country = dataCountry[indexPath.row]
        print(country)
        cell.textLabel?.text = country.name
        
        return cell
    }
    
    // MARK: - Helper
    
    func country(at indexPath: IndexPath) -> Country {
        return dataCountry[indexPath.row]
    }
}
