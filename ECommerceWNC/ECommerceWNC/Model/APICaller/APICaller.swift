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
    
    private init() {}
    
    
    
    public func getJsonResult(completion: @escaping (Result<Response, Error>) -> Void) {
        
        guard let url = base_url else{
            return
        }
        //        var request = URLRequest(url: url)
        //        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        
        dataTask = defaultSession.dataTask(with: url) { (data, response , error) in
            
            print(data!)
            print(response!)
            print(error!)
            
            if let data = data {
                do {
                    let jsonData = try Data(contentsOf: url)
                    let result = try JSONDecoder().decode(Response.self, from: jsonData)
                    print("Homedata: \(result)")
                    DispatchQueue.main.async {
                        completion(.success(result))
                    }
                    
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        dataTask!.resume()
    }
    
}

