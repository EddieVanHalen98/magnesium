//
//  ActionBar.swift
//  magnesium
//
//  Created by James Saeed on 12/03/2020.
//  Copyright © 2020 James Saeed. All rights reserved.
//

import SwiftUI

struct ActionButton: View {
    
    let action: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.white)
                .frame(height: 44)
            Text("Finish")
                .font(.system(size: 17, weight: .semibold, design: .rounded))
                .foregroundColor(Color("primary"))
        }.onTapGesture(perform: action)
    }
}
