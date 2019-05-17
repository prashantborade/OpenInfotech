//
//  WeatherCustomCell.swift
//  NewOpenInfotechDemo
//
//  Created by apple on 15/05/19.
//  Copyright © 2019 krispindia. All rights reserved.
//

import UIKit

class WeatherCustomCell: UITableViewCell {

    @IBOutlet weak var cardEffectView: UIView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblMinTemp: UILabel!
    @IBOutlet weak var lblMaxTemp: UILabel!
    @IBOutlet weak var lblWindSpeed: UILabel!
    @IBOutlet weak var lblCloudPercentage: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
