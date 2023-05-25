//
//  ProductsTableViewCell.swift
//  ECommerceWNC
//
//  Created by Rencheeraj Mohan on 25/05/23.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {
    @IBOutlet weak var productsCollection: UICollectionView!
    var products: HomeData? {
        didSet {
            productsCollection.reloadData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        productsCollection.delegate = self
        productsCollection.dataSource = self
        self.productsCollection.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        self.productsCollection.register(UINib(nibName: "BannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BannerCollectionViewCell")
        self.productsCollection.register(UINib(nibName: "ProductDetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductDetailCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension ProductsTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.values?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch products!.type{
        case CellType.category.rawValue:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.categoryName.text = products?.values?[indexPath.row].name ?? ""
            let url = URL(string: products?.values?[indexPath.row].image_url ?? "")
            cell.categoryImageView.kf.setImage(with: url)
            return cell
        case CellType.banner.rawValue:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as? BannerCollectionViewCell else {
                return UICollectionViewCell()
            }
            let url = URL(string: products?.values?[indexPath.row].banner_url ?? "")
            cell.bannerImage.kf.setImage(with: url)
            return cell
        case CellType.product.rawValue:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductDetailCollectionViewCell", for: indexPath) as? ProductDetailCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.productDescription.text = products?.values?[indexPath.row].name ?? ""
            let url = URL(string: products?.values?[indexPath.row].image ?? "")
            cell.productImage.kf.setImage(with: url)
            if (products?.values?[indexPath.row].is_express == true)
            {
                cell.transportImage.isHidden = false
            }
            if (products?.values?[indexPath.row].offer != 0)
            {
                let int1: Int
                int1 = products?.values?[indexPath.row].offer ?? 0
                cell.offerPrice.text = "\(int1)% OFF"
            }else{
                cell.offerPrice.isHidden = true
            }
            cell.actualPrice.text = products?.values?[indexPath.row].actual_price ?? ""
            cell.currentPrice.text = products?.values?[indexPath.row].offer_price
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    
}
extension ProductsTableViewCell : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch products?.type{
        case CellType.category.rawValue:
            return CGSize(width: 60, height: 150)
        case CellType.banner.rawValue:
            return CGSize(width: 280, height: 180)
        case CellType.product.rawValue:
            return CGSize(width: 160 , height: 300)
        default: return CGSize(width: 0, height: 0)
        }
    }
}
