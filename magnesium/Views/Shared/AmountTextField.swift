//
//  TextField.swift
//  magnesium
//
//  Created by James Saeed on 26/12/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import SwiftUI

struct AmountTextField: View {
    
    @Binding var amount: String
    
    let foodLabel: String
    let onCommit: () -> ()
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack() {
                Rectangle()
                    .frame(height: 44)
                    .foregroundColor(Color("background"))
                    .cornerRadius(8)
                TextField("Enter the title here...", text: $amount, onCommit: {
                    self.onCommit()
                })
                    .autocapitalization(.none)
                    .font(.system(size: 17, weight: .medium, design: .default))
                    .padding(.horizontal, 16)
            }
            Text("grams of \(foodLabel.lowercased())")
                .font(.system(size: 17, weight: .medium, design: .default))
                .opacity(0.75)
                .padding(.leading, 8)
        }
    }
}
