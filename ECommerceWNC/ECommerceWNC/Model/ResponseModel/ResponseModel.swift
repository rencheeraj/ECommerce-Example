//
//  ResponseModel.swift
//  ECommerceWNC
//
//  Created by Rencheeraj Mohan on 25/05/23.
//

import Foundation

enum CellType: String{
    case category = "category"
    case banner = "banners"
    case product = "products"
}


struct Response: Codable {
    let homeData : [HomeData]?
}

struct HomeData: Codable {
    let type: String?
    let values: [ValueDetails]?
   
}
struct ValueDetails: Codable {
    let id: Int?
    let name: String?
    let image_url: String?
    let image: String?
    let banner_url: String?
    let actual_price: String?
    let offer_price: String?
    let offer: Int?
    let is_express: Bool?
}
