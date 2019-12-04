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
                MacroTitle(title: title, color: color)
                MacroDetails(current: current, goal: goal, units: units, color: color)
                MacroBar(current: current, goal: goal, color: color)
            }
            .padding(.leading, 20)
        }
        .padding(.horizontal, 16)
    }
}

struct Card: View {
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .foregroundColor(Color.white)
            .frame(height: 104)
    }
}

struct MacroTitle: View {
    
    let title: String
    let color: Color
    
    var body: some View {
        Text(title)
            .font(.system(size: 14, weight: .semibold, design: .default))
            .foregroundColor(color)
            .padding(.bottom, 4)
    }
}

struct MacroDetails: View {
    
    let current: Double
    let goal: Double
    let units: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 12) {
            MacroLabel(amount: current, units: units)
            Text("/")
                .font(.system(size: 26, weight: .semibold, design: .rounded))
                .foregroundColor(color)
            MacroLabel(amount: goal, units: units)
        }
    }
}

struct MacroLabel: View {
    
    let amount: Double
    let units: String
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 4) {
            Text("\(amount)")
                .font(.system(size: 26, weight: .semibold, design: .rounded))
            Text(units)
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .opacity(0.5)
        }
    }
}

struct MacroBar: View {
    
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
