import UIKit

class CountryCell: UITableViewCell {

    @IBOutlet weak var flagImageView: UIImageView!

    static var identifier: String {
        return "CountryCell"
    }
    
    static var height: CGFloat {
        return 161.0
    }
    
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var subregion: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with viewModel: CountryCellViewModel) {
        self.flagImageView.image = UIImage(named:viewModel.flag)
        self.countryNameLabel.text = viewModel.name
        self.capitalLabel.text = viewModel.capital
        self.populationLabel.text = "\(viewModel.population)"
        self.subregion.text = viewModel.subregion
//        self.languageLabel.text = viewModel.language.name
    }
}
