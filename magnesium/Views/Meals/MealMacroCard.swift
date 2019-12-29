//
//  MealMacroCard.swift
//  magnesium
//
//  Created by James Saeed on 14/12/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import SwiftUI

struct MealMacroCard: View {
    
    let macroType: MacroType
    let macroSets: [MacroSet]
    
    var body: some View {
        ZStack(alignment: .leading) {
            Card()
            VStack(alignment: .leading) {
                CardTitle(title: macroType.rawValue, color: Color(macroType.rawValue))
                ForEach(macroSets, id: \.self) { macroSet in
                    MealMacroCardLabel(macroType: self.macroType, foodTitle: macroSet.foodTitle, amount: macroSet.macros[self.macroType]!)
                }
            }
            .modifier(CardContentPadding())
        }
        .modifier(CardPadding())
    }
}

private struct MealMacroCardLabel: View {
    
    let macroType: MacroType
    let foodTitle: String
    let amount: Double
    
    var body: some View {
        HStack(spacing: 12) {
            HStack(alignment: .bottom, spacing: 4) {
                Text("\(Int(amount))").modifier(CardLabelFont())
                Text(macroType.rawValue.units).modifier(CardSubLabelFont())
            }
            Text("/").modifier(CardLabelFont())
                .foregroundColor(Color(macroType.rawValue))
            Text(foodTitle.lowercased()).modifier(CardLabelFont())
        }
    }
}
