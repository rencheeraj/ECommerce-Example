//
//  APICaller.swift
//  ECommerceWNC
//
//  Created by Rencheeraj Mohan on 25/05/23.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    
    public func getJsonResult(completion: @escaping (Result<[HomeData], Error>) -> Void) {
        
        guard let url = URL(string:base_url) else{
            return
        }
        var request = URLRequest(url: url)
        //        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        
        
        URLSession.shared.dataTask(with: request) { (data, response , error) in
            if let error = error{
                print(error.localizedDescription)
                completion(.failure(error))
                return
            }
            guard let data = data else{
                completion(.failure(error!))
                return
            }
                
            do {
//                let jsonData = try Data(contentsOf: url)
                let result  = try JSONDecoder().decode(Response.self, from: data)
                print("Homedata: \(result)")
                let home : [HomeData] = result.homeData!
                print(home)
                completion(.success(home))
                    
                }
                catch {
                    completion(.failure(error))
                }
        } .resume()
        }
    }


