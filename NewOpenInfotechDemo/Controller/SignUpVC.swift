//
//  SignUpVC.swift
//  NewOpenInfotechDemo
//
//  Created by apple on 15/05/19.
//  Copyright © 2019 krispindia. All rights reserved.
//

import UIKit
import SVProgressHUD
import FirebaseAuth

class SignUpVC: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Sign Up"
    }
    
    @IBAction func btnsignUpClicked(_ sender: Any) {
        
        if (txtEmail.text?.isEmpty)! {
            
            showAlert(title: WebConstant.title, message: WebConstant.EmptyEmail, actionTitles: ["ok"], actions:[{(acton1) in }, {(action2) in }])
        }
        else if !isValidEmail(testStr: txtEmail.text!){
            
            showAlert(title: WebConstant.title, message: WebConstant.CorrectEmail, actionTitles: ["ok"], actions:[{(acton1) in }, {(action2) in }])
        }
        else if (txtPassword.text?.isEmpty)! {
            
             showAlert(title: WebConstant.title, message: WebConstant.EmptyPassword, actionTitles: ["ok"], actions:[{(acton1) in }, {(action2) in }])
        }
        else if (txtPassword.text?.rangeOfCharacter(from: NSCharacterSet.whitespaces) != nil ) {
            
             showAlert(title: WebConstant.title, message: WebConstant.PassWordSpace, actionTitles: ["ok"], actions:[{(acton1) in }, {(action2) in }])
        }
        else if (txtConfirmPassword.text?.isEmpty)! {
            
             showAlert(title: WebConstant.title, message: WebConstant.EmptyConfirmPassWord, actionTitles: ["ok"], actions:[{(acton1) in }, {(action2) in }])
        }
        else if (txtConfirmPassword.text?.rangeOfCharacter(from: NSCharacterSet.whitespaces) != nil) {
        
             showAlert(title: WebConstant.title, message: WebConstant.PassWordSpace, actionTitles: ["ok"], actions:[{(acton1) in }, {(action2) in }])
        }
        else if !(txtPassword.text == txtConfirmPassword.text) {
            
             showAlert(title: WebConstant.title, message: WebConstant.PassWordNotMatch, actionTitles: ["ok"], actions:[{(acton1) in }, {(action2) in }])
        }
        else
        {
            newUserRegister()
        }
    }
    
    func newUserRegister() {
        
        if Connectivity.isConnectedToInternet {
            SVProgressHUD.show()
            SVProgressHUD.setDefaultMaskType(.clear)
            
            Auth.auth().createUser(withEmail: txtEmail.text!, password: txtPassword.text!) { (user, error) in
                
                if user != nil {
                    
                    print("usre loged in")
                    UserDefaults.standard.set(true, forKey: "\(WebConstant.LoggedIn)")
                    
                    let objAppDelegate = (UIApplication.shared.delegate as? AppDelegate)
                    objAppDelegate?.gotoMainController()
                }
                
                if error != nil {
                    
                    print("sign up  Error : \(error!.localizedDescription)")
                }
            }
            
        }
        else
        {
            DispatchQueue.main.async {
                
                SVProgressHUD.dismiss()
                
                self.showAlert(title: WebConstant.title, message: WebConstant.checkInternet, actionTitles: ["ok"], actions:[{(acton1) in }, {(action2) in }])
                
            }
            
        }
    }
    @IBAction func btnGotoSignInClicked(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
