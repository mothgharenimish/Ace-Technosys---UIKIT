//
//  LoginVC.swift
//  Ace-Technosys - UIKIT
//
//  Created by Nimish Mothghare on 16/04/25.
//

import UIKit
import IQKeyboardManagerSwift

class LoginVC: UIViewController {
    
    //MARK: -IBOutlet
    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet weak var googleView: UIView!
    @IBOutlet weak var fbView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailtxtField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordtxtField: UITextField!
    @IBOutlet weak var eyeimg: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    
    
    var iconClick = true

    
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
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        eyeimg.isUserInteractionEnabled = true
        eyeimg.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    //MARK: -Back IBAction
    @IBAction func backAction(_ sender: UIButton) {
       
        
        self.navigationController?.popViewController(animated: true)

        
    }
    
    
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        print("Tapped on the Eye Image")
        
        
           if iconClick {
            passwordtxtField.isSecureTextEntry = false
               print("A")
               eyeimg.image = UIImage(named: "icons8-eye-24 (1)")
           } else {
               passwordtxtField.isSecureTextEntry = true
               print("B")
               eyeimg.image = UIImage(named: "icons8-invisible-32 (2)")

           }
           iconClick = !iconClick

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
            
            
            let email = emailtxtField.text!
            let password = passwordtxtField.text!
            
            APIService.shared.loginUser(email: email, password: password) { result in
                switch result {
                case .success(let token):
                    print("Token: \(token)")
                    DispatchQueue.main.async {
//                        self.showAlert(title: "Success", message: "Token: \(token)")
                        self.shownaviagtionAlert(title: "Login is Successfully", message: "Token: \(token)", completion: {
                            
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            if let ProductVC = storyboard.instantiateViewController(withIdentifier: "ProductVC") as? ProductVC {
                                self.navigationController?.pushViewController(ProductVC, animated: true)
                          
                            }
                        })
                    }
                case .failure(let error):
                    print(" Error: \(error.localizedDescription)")
                    DispatchQueue.main.async {
                        self.showAlert(title: "Login Failed", message: error.localizedDescription)
                    }
                }
            }
        }
        
    }
    
}
