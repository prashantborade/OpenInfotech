//
//  SignInVC.swift
//  NewOpenInfotechDemo
//
//  Created by apple on 15/05/19.
//  Copyright © 2019 krispindia. All rights reserved.
//

import UIKit
import SVProgressHUD
import FirebaseAuth

class SignInVC: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Log In"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSignInClicked(_ sender: Any) {
        
        if (txtEmail.text?.isEmpty)! {
            
            showAlert(title: WebConstant.title, message: WebConstant.EmptyEmail, actionTitles: ["ok"], actions:[{(acton1) in }, {(action2) in }])
        }
        else if !isValidEmail(testStr: txtEmail.text!){
            
            showAlert(title: WebConstant.title, message: WebConstant.EmptyEmail, actionTitles: ["ok"], actions:[{(acton1) in }, {(action2) in }])
        }
        else if (txtPassword.text?.isEmpty)! {
            
        }
        else if (txtPassword.text?.rangeOfCharacter(from: NSCharacterSet.whitespaces) != nil ) {
            
            
        }
        else
        {
            logIn()
        }
    }
    
    func logIn() {
        
        if Connectivity.isConnectedToInternet {
            SVProgressHUD.show()
            SVProgressHUD.setDefaultMaskType(.clear)
            
            Auth.auth().signIn(withEmail: "prashantborade10@gmail.com", password: "prashant@123") { (user, error) in
                
                if user != nil {
                    
                    print("usre loged in")
                    UserDefaults.standard.set(true, forKey: "\(WebConstant.LoggedIn)")
                    
                    let objAppDelegate = (UIApplication.shared.delegate as? AppDelegate)
                    objAppDelegate?.gotoMainController()
                }
                
                if error != nil {
                    
                    print("sign in Error : \(error!.localizedDescription)")
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
    
    @IBAction func btnRegisterNewUser(_ sender: Any) {
        
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        
        self.navigationController?.pushViewController(obj, animated: true)
    }
    

}
