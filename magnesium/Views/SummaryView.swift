//
//  SummaryView.swift
//  magnesium
//
//  Created by James Saeed on 13/10/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import SwiftUI

struct SummaryView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("background").edgesIgnoringSafeArea(.all)
                List {
                    MacroCard(title: "Calories", color: Color("orange"), current: 2425, goal: 3456, units: "kcal")
                    MacroCard(title: "Carbs", color: Color("orange"), current: 2425, goal: 3456, units: "kcal")
                    MacroCard(title: "Protein", color: Color("orange"), current: 2425, goal: 3456, units: "kcal")
                    MacroCard(title: "Fat", color: Color("orange"), current: 2425, goal: 3456, units: "kcal")
                }
            }
            .navigationBarTitle("Summary")
        }
    }
}
