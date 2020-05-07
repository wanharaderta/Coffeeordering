//
//  Order.swift
//  Coffe Ordering
//
//  Created by Wanhar on 06/05/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import Foundation

struct Order: Codable {
    
    let name:String
    let size:String
    let coffeeName:String
    let total:Double
}
