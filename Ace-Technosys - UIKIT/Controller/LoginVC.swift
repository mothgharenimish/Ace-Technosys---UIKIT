//
//  LoginVC.swift
//  Ace-Technosys - UIKIT
//
//  Created by Nimish Mothghare on 16/04/25.
//

import UIKit

class LoginVC: UIViewController {

    //MARK: -IBOutlet
    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet weak var googleView: UIView!
    @IBOutlet weak var fbView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailtxtField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordtxtField: UITextField!
    
    //MARK: -View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        signinBtn.setCornerRadiusBtn(9.0)
        
        googleView.setCornerRadiusView(9.0)
        googleView.layer.borderWidth = 1.0
        googleView.layer.borderColor = UIColor.lightGray.cgColor
        
        fbView.setCornerRadiusView(9.0)
        fbView.layer.borderWidth = 1.0
        fbView.layer.borderColor = UIColor.lightGray.cgColor
        
        emailView.setCornerRadiusView(9.0)
        emailView.layer.borderWidth = 1.0
        emailView.layer.borderColor = UIColor.lightGray.cgColor
        
        passwordView.setCornerRadiusView(9.0)
        passwordView.layer.borderWidth = 1.0
        passwordView.layer.borderColor = UIColor.lightGray.cgColor
        
        
        
     
    }
    
    
    //MARK: -SignIn IBAction
    @IBAction func signinAction(_ sender: UIButton) {
        
        if emailtxtField.text!.isEmpty {
            
            print("The Email text Field is empty")
            
            showAlert(title: "Email", message: "The Email text Field is empty")
            
        }
        
        
        else if passwordtxtField.text!.isEmpty {
            
            print("The password text Field is empty")
            

            showAlert(title: "Password", message: "The Password text Field is empty")

        }
        
        
        else {
            
            print("Not any text field is empty")
        }
        
    }
    
}
