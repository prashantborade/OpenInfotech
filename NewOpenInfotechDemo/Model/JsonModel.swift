//
//  JsonModel.swift
//  NewOpenInfotechDemo
//
//  Created by apple on 16/05/19.
//  Copyright © 2019 krispindia. All rights reserved.
//

import Foundation
import SwiftyJSON



struct JsonModel {
    
    var main:JsonMain
    var dt_txt:String = ""
    var wind:JsonWind
    var clouds:JsonClouds
    var weather:[JsonWeather]
    
    init(json:JSON) {
        
        self.main = JsonMain(jsonMain: json["main"])
        self.wind = JsonWind(jsonWind: json["wind"])
        self.clouds = JsonClouds(jsonClouds: json["clouds"])
        self.dt_txt = json["dt_txt"].stringValue
        self.weather = [JsonWeather(jsonWeather: json["weather"])]
    }
}

struct JsonWeather {
    
    var id:Int
    var main:String = ""
    var description = ""
    var icon = ""
    
    init(jsonWeather:JSON) {
        
        self.id = jsonWeather["id"].intValue
        self.main = jsonWeather["main"].stringValue
        self.description = jsonWeather["description"].stringValue
        self.icon = jsonWeather["icon"].stringValue
        
    }
}
struct JsonMain {
    
    
    var temp:String = ""
    var temp_min:String = ""
    var temp_max:String = ""
    var pressure:String = ""
    var sea_level:String = ""
    var grnd_level:String = ""
    var humidity:String = ""
    
    
    init(jsonMain:JSON) {
    
        self.grnd_level = jsonMain["grnd_level"].stringValue
        self.temp = jsonMain["temp"].stringValue
        self.temp_min = jsonMain["temp_min"].stringValue
        self.temp_max = jsonMain["temp_max"].stringValue
        self.pressure = jsonMain["pressure"].stringValue
        self.sea_level = jsonMain["sea_level"].stringValue
        self.grnd_level = jsonMain["grnd_level"].stringValue
        self.humidity = jsonMain["humidity"].stringValue
    
    }
}

struct JsonClouds
{
    var all:String = ""
    
    init(jsonClouds:JSON) {
        
        self.all = jsonClouds["all"].stringValue
    }
}

struct JsonWind {
    
    var speed:Double
    var deg:Double
    
    
    init(jsonWind:JSON) {
        
        self.speed = jsonWind["speed"].doubleValue
        self.deg = jsonWind["deg"].doubleValue
        
    }
}


