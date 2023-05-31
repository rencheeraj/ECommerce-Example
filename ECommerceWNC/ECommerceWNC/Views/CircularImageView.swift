//
//  CircularImageView.swift
//  ECommerceWNC
//
//  Created by Rencheeraj Mohan on 31/05/23.
//

import UIKit
@IBDesignable
class CircularImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
  
}
