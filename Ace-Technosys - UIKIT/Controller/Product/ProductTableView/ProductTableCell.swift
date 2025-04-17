//
//  ProductTableCell.swift
//  Ace-Technosys - UIKIT
//
//  Created by Nimish Mothghare on 17/04/25.
//

import UIKit

class ProductTableCell: UITableViewCell {
    
    
    //MARK: -IBOutlet 
    @IBOutlet weak var productView: UIView!
    @IBOutlet weak var productnameLbl: UILabel!
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var statusImg: UIImageView!
    @IBOutlet weak var buynowView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
