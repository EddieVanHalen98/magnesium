//
//  MacroCard.swift
//  magnesium
//
//  Created by James Saeed on 13/10/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import SwiftUI

struct MacroCard: View {
    
    let title: String
    let color: Color
    let current: Double
    let goal: Double
    let units: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Card()
            VStack(alignment: .leading) {
                CardTitle(title: title, color: color)
                MacroCardDetails(current: current, goal: goal, units: units, color: color)
                MacroBar(current: current, goal: goal, color: color)
            }
            .modifier(CardContentPadding())
        }
        .modifier(CardPadding())
    }
}

private struct MacroCardDetails: View {
    
    let current: Double
    let goal: Double
    let units: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 12) {
            MacroCardLabel(amount: current, units: units)
            Text("/").modifier(CardLabelFont())
                .foregroundColor(color)
            MacroCardLabel(amount: goal, units: units)
        }
    }
}

private struct MacroCardLabel: View {
    
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
