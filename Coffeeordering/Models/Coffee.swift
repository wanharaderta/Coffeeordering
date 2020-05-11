//
//  Coffe.swift
//  Coffe Ordering
//
//  Created by Wanhar on 06/05/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import Foundation

struct Coffee {
    
    let name:String
    let imageURL : String
    let price:Double
    
}

extension Coffee {
    static func all() -> [Coffee] {
        return [
            Coffee(name: "Cappuccino", imageURL: "Cappuccino", price: 2.5),
            Coffee(name: "Expresso", imageURL: "Expresso", price: 2.1),
            Coffee(name: "Regular", imageURL: "Regular", price: 2.5)
        ]
    }
}
