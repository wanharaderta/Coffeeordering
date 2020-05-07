//
//  WebServices.swift
//  Coffe Ordering
//
//  Created by Wanhar on 06/05/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import Foundation

class WebServices {
    
    func getAllOrders(completion: @escaping ([Order]?) -> ()) {
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data  = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            let orders = try? JSONDecoder().decode([Order].self,from : data)
            DispatchQueue.main.async {
                completion(orders)
            }
        }.resume()
        
        
    }
}
