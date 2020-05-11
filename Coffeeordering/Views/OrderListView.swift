//
//  OrderListView.swift
//  Coffeeordering
//
//  Created by Wanhar on 07/05/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import SwiftUI

struct OrderListView: View {
    
    let orders : [OrderViewModel]
    
    init(orders: [OrderViewModel]) {
        self.orders = orders
    }
    
    var body: some View {
        List {
            
            ForEach(self.orders, id:\.id){ order in
                HStack {
                    Image(order.coffeeName)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(16)
                    
                    VStack {
                        Text(order.name)
                            .font(.title)
                            .padding([.leading, .bottom],10)
                        
                        HStack {
                            Text(order.coffeeName)
                                .padding([.leading, .bottom],10)
                        }
                    }
                }
            }
            
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orders: [OrderViewModel(order: Order(name: "Name", size: "Regular", coffeeName: "Cappuccino", total: 0.0))])
    }
}
