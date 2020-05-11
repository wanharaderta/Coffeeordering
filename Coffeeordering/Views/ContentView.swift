//
//  ContentView.swift
//  Coffeeordering
//
//  Created by Wanhar on 07/05/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListVM = OrderListViewModel()
    
    var body: some View {
        NavigationView {
            OrderListView(orders: self.orderListVM.orders)
            .navigationBarTitle("Coffee Orders")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
