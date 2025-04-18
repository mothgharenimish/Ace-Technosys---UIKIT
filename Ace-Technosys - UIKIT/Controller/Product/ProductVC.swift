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
    
    var likeStatus: [Bool] = []

    
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
    
    
    @objc func statustapped(sender : UIButton) {
        
           let index = sender.tag
           likeStatus[index].toggle()
           
           let indexPath = IndexPath(row: index, section: 0)
           
           if let cell = producttblView.cellForRow(at: indexPath) as? ProductTableCell {
               if likeStatus[index] {
                   cell.statusLbl.text = "Like"
                   cell.statusImg.image = UIImage(named: "icons8-heart-50 (1)")
               } else {
                   cell.statusLbl.text = "Dislike"
                   cell.statusImg.image = UIImage(named: "icons8-black-heart-48")
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

            if likeStatus.count != products.count {
                likeStatus = Array(repeating: false, count: products.count)
            }

            let product = products[indexPath.row]
            cell.productnameLbl.text = product.title
            cell.categoryLbl.text = product.category

            if let price = product.price {
                cell.priceLbl.text = "Rs \(price)"
            } else {
                cell.priceLbl.text = "Rs 0.0"
            }

            cell.descriptionLbl.text = product.description

            if let imageUrlString = product.image, let imageUrl = URL(string: imageUrlString) {
                cell.productImg.kf.setImage(with: imageUrl)
            }

            if let rating = product.rating?.rate {
                cell.ratingLbl.text = "\(rating)"
            } else {
                cell.ratingLbl.text = "0.0 Rating"
            }

            cell.ratingView.settings.updateOnTouch = false
            cell.ratingView.settings.fillMode = .full
            cell.ratingView.settings.starSize = 18
            cell.ratingView.settings.filledColor = UIColor.orange
            cell.ratingView.settings.emptyBorderColor = UIColor.red
            cell.ratingView.settings.filledBorderColor = UIColor.red
            cell.ratingView.settings.filledImage = UIImage(named: "GoldStarFilled")
            cell.ratingView.settings.emptyImage = UIImage(named: "GoldStarEmpty")
            cell.ratingView.rating = product.rating?.rate ?? 0.0

            let isLiked = likeStatus[indexPath.row]
            cell.statusLbl.text = isLiked ? "Like" : "Dislike"
            cell.statusImg.image = UIImage(named: isLiked ? "icons8-heart-50 (1)" : "icons8-black-heart-48")

            cell.statusBtn.tag = indexPath.row
            cell.statusBtn.addTarget(self, action: #selector(statustapped), for: .touchUpInside)

            return cell
    }
    
    
    
    
    
}
