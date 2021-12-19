//
//  citiesNameCell.swift
//  WeatherKalinichev
//
//  Created by user on 19.12.2021.
//

import UIKit

class citiesNameCell: UITableViewCell {
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var Temp: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
