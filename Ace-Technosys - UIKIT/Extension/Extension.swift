//
//  Extension.swift
//  Ace-Technosys - UIKIT
//
//  Created by Nimish Mothghare on 15/04/25.
//

import Foundation
import UIKit

extension UIButton {
    
    
    func setCornerRadiusBtn(_ radius: CGFloat) {
           self.layer.cornerRadius = radius
       }
    
}


extension UIView {
    
    func setCornerRadiusView(_ radius: CGFloat) {
           self.layer.cornerRadius = radius
       }
    
}

extension UIViewController {
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

