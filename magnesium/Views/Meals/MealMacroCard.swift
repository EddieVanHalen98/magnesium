//
//  MealMacroCard.swift
//  magnesium
//
//  Created by James Saeed on 14/12/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import SwiftUI

struct MealMacroCard: View {
    
    let title: String
    let color: Color
    let userMacroSets: [UserMacroSet]
    
    var body: some View {
        ZStack(alignment: .leading) {
            Card()
            VStack(alignment: .leading) {
                CardTitle(title: title, color: color)
                // Populate with meal macro card labels
            }
            .modifier(CardContentPadding())
        }
        .modifier(CardPadding())
    }
}

private struct MealMacroCardLabel: View {
    
    let foodTitle: String
    let amount: Double
    let units: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 12) {
            HStack(alignment: .bottom, spacing: 4) {
                Text("\(Int(amount))").modifier(CardLabelFont())
                Text(units).modifier(CardSubLabelFont())
            }
            Text("/").modifier(CardLabelFont())
                .foregroundColor(color)
            Text(foodTitle).modifier(CardLabelFont())
        }
    }
}
