//
//  Card.swift
//  magnesium
//
//  Created by James Saeed on 14/12/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import SwiftUI

struct Card: View {
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .foregroundColor(Color.white)
    }
}

struct CardTitle: View {
    
    let title: String
    let color: Color
    
    var body: some View {
        Text(title)
            .font(.system(size: 14, weight: .semibold, design: .default))
            .foregroundColor(color)
            .padding(.bottom, 6)
    }
}

struct CardLabelFont: ViewModifier {
    
    func body(content: Content) -> some View {
        content.font(.system(size: 26, weight: .semibold, design: .rounded))
    }
}

struct CardSubLabelFont: ViewModifier {
    
    func body(content: Content) -> some View {
        content.font(.system(size: 14, weight: .semibold, design: .rounded)).opacity(0.5)
    }
}

struct CardContentPadding: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 16)
            .padding(.leading, 20)
            .padding(.trailing, 24)
    }
}

struct CardPadding: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
    }
}
