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
    var homeData : [HomeData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        APICaller.shared.getJsonResult() { result in
            switch result{
            case .success(let json):
                self.homeData = json
                print("########### \(self.homeData)")
                self.tableReload(vc: self.homeData!)
            case .failure(let error):
                print(error)
            }
        }
    }
    func tableReload(vc : [HomeData]){
        DispatchQueue.main.async {
            self.displayTableView.delegate = self
            self.displayTableView.dataSource = self
            self.displayTableView.register(UINib(nibName: "ProductsTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductsTableViewCell")
            self.displayTableView.reloadData()
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeData!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "ProductsTableViewCell", for: indexPath) as?
                ProductsTableViewCell else {
            fatalError("Unable to downcast the cell in cellForRowAt to ItemTableViewCell")
        }
        cell.products = homeData?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return self.view.frame.size.height/6.5
        }
        else if indexPath.row == 1{
            return self.view.frame.size.height/4
        }else{
            return self.view.frame.size.height/2
        }
    }
}

