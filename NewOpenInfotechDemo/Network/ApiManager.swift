//
//  ApiManager.swift
//  NewOpenInfotechDemo
//
//  Created by apple on 16/05/19.
//  Copyright © 2019 krispindia. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Connectivity {
    
    class var isConnectedToInternet:Bool {
        
        return NetworkReachabilityManager()!.isReachable
    }
}
