//
//  AddFoodViewModel.swift
//  magnesium
//
//  Created by James Saeed on 26/12/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import Foundation

class AddFoodViewModel: ObservableObject {
    
    @Published var searchResults = [FoodItem]()
    
    func search(query: String) {
        APIGateway.shared.search(query: query) { foodItems in
            if let foodItems = foodItems {
                self.searchResults = foodItems
            }
        }
    }
}
