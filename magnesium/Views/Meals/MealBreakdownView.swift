//
//  MealBreakdownView.swift
//  magnesium
//
//  Created by James Saeed on 14/12/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import SwiftUI

struct MealBreakdownView: View {
    
    let mealType: MealType
    
    var body: some View {
        Text("Meal breakdown view")
        .navigationBarTitle(mealType.rawValue.capitalized)
    }
}
