//
//  SummaryView.swift
//  magnesium
//
//  Created by James Saeed on 13/10/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import SwiftUI

struct SummaryView: View {
    
    @EnvironmentObject var store: UserMacroSetStore
    
    @State var currentCalories: Double = 0
    @State var currentCarbs: Double = 0
    @State var currentProtein: Double = 0
    @State var currentFat: Double = 0
    
    var body: some View {
        NavigationView {
            List {
                MacroCard(title: "Calories", color: Color("orange"), current: currentCalories, goal: 3456, units: "kcal")
                MacroCard(title: "Carbs", color: Color("blue"), current: currentCarbs, goal: 311, units: "g")
                MacroCard(title: "Protein", color: Color("pink"), current: currentProtein, goal: 112, units: "g")
                MacroCard(title: "Fat", color: Color("purple"), current: currentFat, goal: 89, units: "g")
            }
            .navigationBarTitle("Summary")
        }
    }
    
    func getUserMacroSet() {
        currentCalories = store.userMacroSets.map({ $0.macros.calories }).reduce(0, { $0 + $1 })
        currentCarbs = store.userMacroSets.map({ $0.macros.carbs }).reduce(0, { $0 + $1 })
        currentProtein = store.userMacroSets.map({ $0.macros.protein }).reduce(0, { $0 + $1 })
        currentFat = store.userMacroSets.map({ $0.macros.fat }).reduce(0, { $0 + $1 })
    }
}
