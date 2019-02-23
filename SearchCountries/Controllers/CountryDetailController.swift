import UIKit

class CountryDetailController: UIViewController {

    var country: Country!
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var dataSource: CountryDetailDataSource = {
        return CountryDetailDataSource(countryDetail: [self.country])
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = country.name
        tableView.register(UINib(nibName: CountryCell.identifier, bundle: nil), forCellReuseIdentifier: CountryCell.identifier)
        tableView.dataSource = dataSource
    }
}

extension CountryDetailController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CountryCell.height
    }
}
