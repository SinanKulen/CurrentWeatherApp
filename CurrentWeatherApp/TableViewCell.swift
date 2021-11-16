//
//  TableViewCell.swift
//  CurrentWeatherApp
//
//  Created by Sinan Kulen on 16.11.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var enYuksekSicaklik: UILabel!
    @IBOutlet weak var enDusukSicaklik: UILabel!
    @IBOutlet weak var sicaklik: UILabel!
    @IBOutlet weak var hissedilenSicaklik: UILabel!
    @IBOutlet weak var basinc: UILabel!
    @IBOutlet weak var nem: UILabel!
    @IBOutlet weak var ruzgarHizi: UILabel!
    
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
