//
//  WeatherInfoDetails.swift
//  NewOpenInfotechDemo
//
//  Created by apple on 15/05/19.
//  Copyright © 2019 krispindia. All rights reserved.
//

import UIKit

class WeatherInfoDetails: UIViewController {

    @IBOutlet weak var lblInfo: UILabel!
    
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var lblMinTemp: UILabel!
    
    @IBOutlet weak var lblMaxTemp: UILabel!
    
    @IBOutlet weak var lblWindSpeed: UILabel!
    @IBOutlet weak var lblCloudPercentage: UILabel!
    
    @IBOutlet weak var lblHumidity: UILabel!
    
    var WeatherDetails:JsonModel!
    var Cityname:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if WeatherDetails != nil {
            lblInfo.text = "\(Cityname) Weather Information"
            lblDate.text = "Date :\(WeatherDetails.dt_txt)"
            lblMinTemp.text = "Min Temmp : \(WeatherDetails.main.temp_min)"
            lblMaxTemp.text = "Max Temmp : \(WeatherDetails.main.temp_max)"
            lblHumidity.text = "Humidity : \(WeatherDetails.main.humidity)"
            lblWindSpeed.text = "Wind Speed :\(WeatherDetails.wind.speed)"
            lblCloudPercentage.text = "Clouds% :\(WeatherDetails.clouds.all)"
        }
  
    }
    

  
}
