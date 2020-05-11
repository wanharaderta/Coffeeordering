//
//  AddCoffeeOrderViewModel.swift
//  Coffeeordering
//
//  Created by Wanhar on 11/05/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import Foundation

class AddCoffeeOrderViewModel: ObservableObject {
    
    var name: String = ""
    @Published var size: String = "Medium"
    @Published var coffeeName = ""
    
    private var webService : WebServices
    
    var coffeeList: [CoffeeViewModel] {
        return Coffee.all().map(CoffeeViewModel.init)
    }
    
    init() {
        self.webService = WebServices()
    }
    
    var total : Double {
        return calculateTotalPrice()
    }
    
    func placeOrder() {
        self.webService.CreateCoffeeOrders(order: Order(name: self.name, size: self.size, coffeeName: self.coffeeName, total: self.total)) { _ in
            
        }
    }
    
    private func priceForSize() -> Double {
        let price = ["Small":2.0, "Medium": 3.0, "Large": 4.0]
        return price[self.size]!
    }
    
    private func calculateTotalPrice() -> Double {
        let coffeeVM = coffeeList.first { $0.name == coffeeName}
        if let coffeeVM = coffeeVM {
            return coffeeVM.price * priceForSize()
        } else {
            return 0.0
        }
    }
}
