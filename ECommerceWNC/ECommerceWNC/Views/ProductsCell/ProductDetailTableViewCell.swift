//
//  ProductDetailTableViewCell.swift
//  ECommerceWNC
//
//  Created by Rencheeraj Mohan on 25/05/23.
//

import UIKit

class ProductDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var currentPrice: UILabel!
    @IBOutlet weak var actualPrice: UILabel!
    @IBOutlet weak var transportImage: UIImageView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var offerPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
