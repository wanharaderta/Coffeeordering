//
//  AddCoffeeOrderView.swift
//  Coffeeordering
//
//  Created by Wanhar on 11/05/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    
    @ObservedObject private var addCoffeeVM = AddCoffeeOrderViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Information").font(.body)){
                        TextField("Enter Name", text: self.$addCoffeeVM.name)
                    }
                    
                    Section(header: Text("Select Coffee").font(.body)){
                        ForEach(addCoffeeVM.coffeeList, id:\.name) { coffee in
                            CoffeeCellView(coffee: coffee,selection: self.$addCoffeeVM.coffeeName)
                        }
                    }
                }
            }
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView()
    }
}

struct CoffeeCellView: View {
    
    let coffee: CoffeeViewModel
    @Binding var selection : String
    
    var body: some View {
        HStack {
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)
            Text(coffee.name)
                .font(.title)
                .padding([.leading],20)
            Image(systemName: self.selection == self.coffee.name ? "checkmark" : "").padding()
        }.onTapGesture {
            self.selection = self.coffee.name
        }
    }
}
