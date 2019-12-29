//
//  MacroCard.swift
//  magnesium
//
//  Created by James Saeed on 13/10/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import SwiftUI

struct MacroCard: View {
    
    let macroType: MacroType
    let current: Double
    let goal: Double
    
    var body: some View {
        ZStack(alignment: .leading) {
            Card()
            VStack(alignment: .leading) {
                CardTitle(title: macroType.rawValue.capitalized, color: Color(macroType.rawValue))
                MacroCardDetails(macroType: macroType, current: current, goal: goal)
                MacroBar(current: current, goal: goal, color: Color(macroType.rawValue))
            }
            .modifier(CardContentPadding())
        }
        .modifier(CardPadding())
    }
}

private struct MacroCardDetails: View {
    
    let macroType: MacroType
    let current: Double
    let goal: Double
    
    var body: some View {
        HStack(spacing: 12) {
            MacroCardLabel(amount: current, units: macroType.rawValue.units)
            Text("/").modifier(CardLabelFont())
                .foregroundColor(Color(macroType.rawValue))
            MacroCardLabel(amount: goal, units: macroType.rawValue.units)
        }
    }
}

struct MacroCardLabel: View {
    
    let amount: Double
    let units: String
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 4) {
            Text("\(Int(amount))").modifier(CardLabelFont())
            Text(units).modifier(CardSubLabelFont())
        }
    }
}

private struct MacroBar: View {
    
    let current: Double
    let goal: Double
    let color: Color
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 2)
                .frame(width: 256, height: 4)
                .foregroundColor(.black)
                .opacity(0.1)
            RoundedRectangle(cornerRadius: 2)
                .frame(width: CGFloat((current / goal) * 256.0), height: 4)
                .foregroundColor(color)
        }
    }
}
