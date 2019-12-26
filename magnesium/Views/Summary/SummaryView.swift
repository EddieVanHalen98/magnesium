//
//  SummaryView.swift
//  magnesium
//
//  Created by James Saeed on 13/10/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import SwiftUI

struct SummaryView: View {
    
    @EnvironmentObject var store: MacroSetStore
    
    @State var currentCalories: Double = 0
    @State var currentCarbs: Double = 0
    @State var currentProtein: Double = 0
    @State var currentFat: Double = 0
    
    var body: some View {
        NavigationView {
            List {
                MacroCard(macroType: .calories, current: currentCalories, goal: 3456)
                MacroCard(macroType: .carbs, current: currentCarbs, goal: 311)
                MacroCard(macroType: .protein, current: currentProtein, goal: 112)
                MacroCard(macroType: .fat, current: currentFat, goal: 89)
            }
            .navigationBarTitle("Summary")
            .onAppear {
                self.getCurrentMacros()
            }
        }
    }
    
    func getCurrentMacros() {
        currentCalories = store.macroSets.map({ $0.macros[.calories] ?? 0 }).reduce(0, { $0 + $1 })
        currentCarbs = store.macroSets.map({ $0.macros[.carbs] ?? 0 }).reduce(0, { $0 + $1 })
        currentProtein = store.macroSets.map({ $0.macros[.protein] ?? 0 }).reduce(0, { $0 + $1 })
        currentFat = store.macroSets.map({ $0.macros[.fat] ?? 0 }).reduce(0, { $0 + $1 })
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView().previewDevice("iPhone 11 Pro")
    }
}
