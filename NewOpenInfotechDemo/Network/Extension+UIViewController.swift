//
//  Extension+UIViewController.swift
//  NewOpenInfotechDemo
//
//  Created by apple on 16/05/19.
//  Copyright © 2019 krispindia. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func showAlert(title:String?,message:String?,actionTitles:[String?],actions:[((UIAlertAction) -> Void)?]) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        for (index, title) in actionTitles.enumerated() {
            
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func setCardView(view : UIView){
        
        view.layer.cornerRadius = 5.0
        view.layer.borderColor  =  UIColor.clear.cgColor
        view.layer.borderWidth = 5.0
        view.layer.shadowOpacity = 0.5
        view.layer.shadowColor =  UIColor.lightGray.cgColor
        view.layer.shadowRadius = 5.0
        view.layer.shadowOffset = CGSize(width:5, height: 5)
        view.layer.masksToBounds = true
        
    }
}
