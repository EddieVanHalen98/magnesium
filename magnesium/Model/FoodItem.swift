//
//  FoodItem.swift
//  magnesium
//
//  Created by James Saeed on 26/12/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import Foundation

struct JSONFoodItems: Decodable {
    
    let parsed: [JSONFoodItem]
    
    enum CodingKeys: String, CodingKey {
        
        case parsed = "hints"
    }
}

struct JSONFoodItem: Decodable {
    
    let foodItem: FoodItem
    
    enum CodingKeys: String, CodingKey {
        
        case foodItem = "food"
    }
}

struct FoodItem: Hashable, Decodable {
    
    let label: String
    let nutrients: FoodItemNutrients
    let brand: String?
}

struct FoodItemNutrients: Hashable, Decodable {
    
    let calories: Double?
    let protein: Double?
    let carbs: Double?
    let fat: Double?
    
    func allExist() -> Bool {
        return calories != nil && protein != nil && carbs != nil && fat != nil
    }
    
    enum CodingKeys: String, CodingKey {
        
        case calories = "ENERC_KCAL"
        case protein = "PROCNT"
        case carbs = "CHOCDF"
        case fat = "FAT"
    }
}
