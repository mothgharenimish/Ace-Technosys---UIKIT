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
    
    //MARK: -View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        signinBtn.setCornerRadiusBtn(9.0)
     
    }
    
    
    //MARK: -SignIn IBAction
    @IBAction func signinAction(_ sender: UIButton) {
        
        
    }
    
}
