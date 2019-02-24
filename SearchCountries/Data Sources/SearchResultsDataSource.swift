import Foundation
import UIKit

class SearchResultsDataSource: NSObject, UITableViewDataSource {
    
    private var dataCountry = [Country]()
    
    func update(with countries: [Country]) {
        dataCountry = countries
        print("data country:\(dataCountry)")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: - Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCountry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsCell", for:indexPath)
//        for cell in tableView.visibleCells {
//        if dataCountry[indexPath.row].name.count <= 10 {
            let country = dataCountry[indexPath.row]
//            print(country.name.count)
            cell.textLabel?.text = country.name
//        }
        
        return cell
    }
    
    // MARK: - Helper
    
    func country(at indexPath: IndexPath) -> Country {
        return dataCountry[indexPath.row]
    }
}
