import UIKit
import SwiftSVG

class CountryCell: UITableViewCell {

   
    @IBOutlet weak var flagView: UIView!
    

    static var identifier: String {
        return "CountryCell"
    }
    
    static var height: CGFloat {
        return 282.0
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

        let svgURL = URL(string: viewModel.flag)!
        let svgView = UIView(SVGURL: svgURL) { (svgLayer) in

            svgLayer.resizeToFit(self.flagView.bounds)
        }
       
        self.flagView.addSubview(svgView)
        
        self.countryNameLabel.text = "Country: \(viewModel.name)"
        self.capitalLabel.text = "Capital: \(viewModel.capital)"
        self.populationLabel.text = "Population: \(viewModel.population)"
        self.subregion.text = "Subregion: \(viewModel.subregion)"
        self.languageLabel.text = "Language: \(viewModel.languages[0].name, viewModel.languages[0].nativeName)"
    }
}
