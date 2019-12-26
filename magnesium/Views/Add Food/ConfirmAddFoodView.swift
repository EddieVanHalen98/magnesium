//
//  ConfirmAddFoodView.swift
//  magnesium
//
//  Created by James Saeed on 26/12/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import SwiftUI

struct ConfirmAddFoodView: View {
    
    let foodItem: FoodItem
    
    var body: some View {
        HStack {
            Text("\(foodItem.nutrients.calories!) kcal")
        }.navigationBarTitle(foodItem.label)
        .navigationBarItems(trailing: Button(action: {
            // add food
        }, label: {
            Text("Add")
        }))
    }
}
