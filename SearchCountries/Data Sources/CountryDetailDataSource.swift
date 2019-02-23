import Foundation
import UIKit

class CountryDetailDataSource: NSObject, UITableViewDataSource {
    
    private let countryDetail: [Country]
    
    init(countryDetail: [Country]) {
        self.countryDetail = countryDetail
        super.init()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(CountryCell.identifier)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.identifier, for: indexPath) as! CountryCell
        let country = countryDetail[indexPath.row]
        let viewModel = CountryCellViewModel(country: country)
        cell.configure(with: viewModel)
        
        return cell
    }
    
    
    
}
