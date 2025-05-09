//
//  MainVC.swift
//  Ace-Technosys - UIKIT
//
//  Created by Nimish Mothghare on 15/04/25.
//

import UIKit

class MainVC: UIViewController {
    
    //MARK: -IBOutlet
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var alreadyBtn: UIButton!
    
    //MARK: -View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signupBtn.setCornerRadiusBtn(9.0)
        alreadyBtn.setCornerRadiusBtn(9.0)
        alreadyBtn.layer.borderWidth = 2.0
        alreadyBtn.layer.borderColor = UIColor.lightGray.cgColor

    }
    
    //MARK: -SIgnUP IBAction
    @IBAction func sugnupAction(_ sender: UIButton) {
        
       
    }
    
    
    
    @IBAction func alreadyaccountAction(_ sender: UIButton) {
        
        let secondViewController = self.storyboard!.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController!.pushViewController(secondViewController, animated: true)
    }
    

}
