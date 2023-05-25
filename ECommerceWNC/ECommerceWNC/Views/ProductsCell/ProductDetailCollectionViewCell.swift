//
//  ProductDetailCollectionViewCell.swift
//  ECommerceWNC
//
//  Created by Rencheeraj Mohan on 26/05/23.
//

import UIKit

class ProductDetailCollectionViewCell: UICollectionViewCell {
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

}
