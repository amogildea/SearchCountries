import UIKit

class SearchResultsController: UIViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    let dataSource = SearchResultsDataSource()
    let client = RestCountriesAPIClient()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSearchCountroller()
    }
    
    private func initSearchCountroller() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissController))
        tableView.tableHeaderView = searchController.searchBar
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        
        tableView.dataSource = dataSource
        definesPresentationContext = true
        
    }
    
    @objc func dismissController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetail" {
            if let selectedIndex = tableView.indexPathForSelectedRow {
                let country = dataSource.country(at: selectedIndex)
                
                let countryDetailController = segue.destination as! CountryDetailController
                countryDetailController.country = country
            }
        }
    }
}

extension SearchResultsController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        client.getCountry(with: searchController.searchBar.text!) { [unowned self] countries, error in
            if let countries = countries {
                 self.dataSource.update(with: countries)
                print("countries: \(countries)")
            }
           
        }
//        dataSource.update(with: [Stub.country])
        tableView.reloadData()
    }
}

extension SearchResultsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
