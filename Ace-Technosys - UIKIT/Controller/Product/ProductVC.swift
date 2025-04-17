//
//  ProductVC.swift
//  Ace-Technosys - UIKIT
//
//  Created by Nimish Mothghare on 17/04/25.
//

import UIKit

class ProductVC: UIViewController {
    
    
    //MARK: -IBOutlet
    @IBOutlet weak var producttblView: UITableView!
    
    //MARK: -Product Array
    var products = [Products]()
    
    //MARK: -View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.producttblView.delegate = self
        self.producttblView.dataSource = self
    }
    
}


extension ProductVC : UITableViewDelegate {
    
    
}


extension ProductVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = producttblView.dequeueReusableCell(withIdentifier: "ProductTableCell", for: indexPath) as! ProductTableCell
        
        
        return cell
    }
    
    
    
}
