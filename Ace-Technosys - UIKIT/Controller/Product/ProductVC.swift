//
//  ProductVC.swift
//  Ace-Technosys - UIKIT
//
//  Created by Nimish Mothghare on 17/04/25.
//

import UIKit
import Kingfisher
import Cosmos

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
        
        fetchProductData()
        
        
        producttblView.register(UINib(nibName: "ProductTableCell", bundle: nil), forCellReuseIdentifier: "ProductTableCell")
    }
    
    
    func fetchProductData() {
            APIService.shared.fetchProducts { result in
                switch result {
                case .success(let products):
                    self.products = products
                    print(products)
                    DispatchQueue.main.async {
                        self.producttblView.reloadData()
                    }
                case .failure(let error):
                    print("Failed to fetch products:", error)
                }
            }
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
        cell.productnameLbl.text = products[indexPath.row].title
        cell.categoryLbl.text = products[indexPath.row].category
        if let price = products[indexPath.row].price {
               cell.priceLbl.text = "Rs \(price)"
           } else {
               cell.priceLbl.text = "Rs 0.0"
           }
        return cell
    }
    
    
    
    
    
}
