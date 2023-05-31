//
//  CategoryCollectionViewCell.swift
//  ECommerceWNC
//
//  Created by Rencheeraj Mohan on 25/05/23.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var circularImageView : CircularImageView!
    @IBOutlet weak var categoryName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
