//
//  ViewController.swift
//  ECommerceWNC
//
//  Created by Rencheeraj Mohan on 25/05/23.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var displayTableView: UITableView!
    var productData: Response?
    var homeData : [HomeData]?{
        didSet{
            displayTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        APICaller.shared.getJsonResult() { (result) in
            switch result{
            case .success(let json):
                self.productData = json
                print("########### \(self.productData)")
                DispatchQueue.main.async {
                    self.displayTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
        print(productData)
        
        displayTableView.delegate = self
        displayTableView.dataSource = self
        self.displayTableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
        self.displayTableView.register(UINib(nibName: "BannerTableViewCell", bundle: nil), forCellReuseIdentifier: "BannerTableViewCell")
        self.displayTableView.register(UINib(nibName: "ProductDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductDetailTableViewCell")
    }
    
    
}

extension ViewController: UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeData![0].values!.count
    }
}
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch homeData![0].type{
        case CellType.category.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as? CategoryTableViewCell else {
                return UITableViewCell()
            }
            cell.categoryName.text = homeData![0].values?[indexPath.row].name ?? ""
            let url = URL(string: homeData![0].values?[indexPath.row].image_url ?? "")
            cell.categoryImageView.kf.setImage(with: url)
            return cell
        case CellType.banner.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell", for: indexPath) as? BannerTableViewCell else {
                return UITableViewCell()
            }
            let url = URL(string: homeData![0].values?[indexPath.row].banner_url ?? "")
            cell.bannerImage.kf.setImage(with: url)
            return cell
        case CellType.product.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailTableViewCell", for: indexPath) as? ProductDetailTableViewCell else {
                return UITableViewCell()
            }
            cell.productDescription.text = homeData![0].values?[indexPath.row].name ?? ""
            let url = URL(string: homeData![0].values?[indexPath.row].image ?? "")
            cell.productImage.kf.setImage(with: url)
            if (homeData![0].values?[indexPath.row].is_express == true)
            {
                cell.transportImage.isHidden = false
            }
            if (homeData![0].values?[indexPath.row].offer != 0)
            {
                let int1: Int
                int1 = homeData![0].values?[indexPath.row].offer ?? 0
                cell.offerPrice.text = "\(int1)% OFF"
            }
            cell.actualPrice.text = homeData![0].values?[indexPath.row].actual_price ?? ""
            cell.currentPrice.text = homeData![0].values?[indexPath.row].offer_price
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    
}

