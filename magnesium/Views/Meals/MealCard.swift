//
//  MealCard.swift
//  magnesium
//
//  Created by James Saeed on 14/12/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import SwiftUI

struct MealCard: View {
    
    @EnvironmentObject var store: MacroSetStore
    
    let meal: MealType
    
    var body: some View {
        ZStack(alignment: .leading) {
            Card()
            NavigationLink(destination: MealBreakdownView(mealType: meal)) {
                HStack {
                    VStack(alignment: .leading) {
                        CardTitle(title: meal.rawValue.capitalized, color: Color("primary"))
                        MealCardLabel(foodTitles: getFoodTitles(for: meal))
                    }
                    Spacer()
                    Image(systemName: "arrow.right")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .opacity(0.2)
                }
            }
            .modifier(CardContentPadding())
        }
        .modifier(CardPadding())
        .accentColor(.black)
    }
    
    func getFoodTitles(for meal: MealType) -> [String] {
        let foodTitles: [String] = store.macroSets.filter { $0.meal == meal }.map { macroSet in
            return macroSet.foodTitle
        }
        
        return foodTitles
    }
}

private struct MealCardLabel: View {
    
    let foodTitles: [String]
    
    var body: some View {
        Text(foodTitles.isEmpty ? "nothing" : foodTitles.joined(separator: "&").lowercased()).modifier(CardLabelFont())
            .opacity(foodTitles.isEmpty ? 0.32 : 1.0)
    }
}
