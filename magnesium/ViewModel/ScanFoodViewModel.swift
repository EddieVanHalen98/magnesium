//
//  ScanFoodViewModel.swift
//  magnesium
//
//  Created by James Saeed on 28/12/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import Foundation

class ScanFoodViewModel: ObservableObject {
    
    @Published var barcode: String? {
        didSet {
            self.search()
        }
    }
    
    @Published var barcodeResult: FoodItem?
    
    private func search() {
        print("searching")
        APIGateway.shared.search(barcode: barcode!) { foodItem in
            if let foodItem = foodItem {
                print("found \(foodItem.label)")
            }
            
            self.barcodeResult = foodItem
        }
    }
}
