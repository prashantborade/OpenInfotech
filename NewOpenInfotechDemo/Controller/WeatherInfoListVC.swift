//
//  WeatherInfoListVC.swift
//  NewOpenInfotechDemo
//
//  Created by apple on 15/05/19.
//  Copyright © 2019 krispindia. All rights reserved.
//

import UIKit
import SVProgressHUD
import FirebaseAuth
import SwiftyJSON


class WeatherInfoListVC: UIViewController {

    var data = [JsonModel]()

    @IBOutlet weak var txtCityName: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Weather Information List"
        txtCityName.text = "Mumbai"
         getData()
    }
    
    @IBAction func btnLogOutClicked(_ sender: Any) {
        
         showAlert(title: WebConstant.logOutTitle, message: WebConstant.logOutMessage, actionTitles: ["Yes","No"], actions:[{(acton1) in
            
            self.logOut()
            
            }, {(action2) in }])
    }
    
    @IBAction func btnRefreshClicked(_ sender: Any) {
        
        
        getData()
    }
    
    func getData()
    {
        
        if Connectivity.isConnectedToInternet {
            SVProgressHUD.show()
            SVProgressHUD.setDefaultMaskType(.clear)
            
            guard let city = txtCityName.text , !city.isEmpty else {
                
                 showAlert(title: WebConstant.title, message: WebConstant.EmptyCity, actionTitles: ["ok"], actions:[{(acton1) in }, {(action2) in }])
                
                return
            }
        
            let url = URL(string:"https://api.openweathermap.org/data/2.5/forecast?q=\(city)&APPID=\(WebConstant.ApiKey)")
            
            print("URL = \(url!)")
         
            
            URLSession.shared.dataTask(with: url!) { (data, response, error) in
                
                guard let data = data else { return }
                print("data = \(data)")

                do{
                    
                    let json = try JSON(data: data)
                    
                    let results = json["list"]
                    
                   let city = json["city"]
                    
                    print("City = \(city)")
                    for arr in results.arrayValue {
                        
                        self.data.append(JsonModel(json: arr))
                        
                    }
                    
                    DispatchQueue.main.async {
                        
                        self.tableView.reloadData()
                    }
                    
                    SVProgressHUD.dismiss()
                    
                }catch
                {
                
                    print("Error = \(error)")
                    SVProgressHUD.dismiss()
                    
                     self.showAlert(title: WebConstant.title, message: error.localizedDescription
                        , actionTitles: ["ok"], actions:[{(acton1) in }, {(action2) in }])
                    
                }
                
                
            }.resume()
        }
        else
        {
            DispatchQueue.main.async {
                
                SVProgressHUD.dismiss()
                
                self.showAlert(title: WebConstant.title, message: WebConstant.checkInternet, actionTitles: ["ok"], actions:[{(acton1) in }, {(action2) in }])
                
            }
            
        }
    }
    func logOut() {
        
        if Connectivity.isConnectedToInternet {
            SVProgressHUD.show()
            SVProgressHUD.setDefaultMaskType(.clear)
            
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
                UserDefaults.standard.set(false, forKey:"\(WebConstant.LoggedIn)")
                let objAppDelegate = (UIApplication.shared.delegate as? AppDelegate)
                objAppDelegate?.gotoSignIn()
                SVProgressHUD.dismiss()
            } catch let signOutError as NSError {
                
                print ("Error signing out: %@", signOutError)
            }
            
            SVProgressHUD.dismiss()
        }
        else
        {
            DispatchQueue.main.async {
                
                SVProgressHUD.dismiss()
                
                self.showAlert(title: WebConstant.title, message: WebConstant.checkInternet, actionTitles: ["ok"], actions:[{(acton1) in }, {(action2) in }])
                
            }
            
        }
    }

}

extension WeatherInfoListVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
       return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:WeatherCustomCell = self.tableView.dequeueReusableCell(withIdentifier: "WeatherCustomCell", for: indexPath) as! WeatherCustomCell
        
        
        cell.lblDate.text = "Date :\(data[indexPath.row].dt_txt)"
        cell.lblMinTemp.text = "Min Temmp : \(data[indexPath.row].main.temp_min)"
        cell.lblMaxTemp.text = "Max Temmp : \(data[indexPath.row].main.temp_max)"
        cell.lblHumidity.text = "Humidity : \(data[indexPath.row].main.humidity)"
        cell.lblWindSpeed.text = "Wind Speed :\(data[indexPath.row].wind.speed)"
        cell.lblCloudPercentage.text = "Clouds% :\(data[indexPath.row].clouds.all)"
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "WeatherInfoDetails") as! WeatherInfoDetails
        obj.WeatherDetails = data[indexPath.row]
        obj.Cityname = txtCityName.text!
        self.navigationController?.pushViewController(obj, animated: true)
    }
    
}
