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
    
    var body: some View {
        NavigationView {
            List {
                MacroCard(title: "Calories", color: Color("orange"), current: 2425, goal: 3456, units: "kcal")
                MacroCard(title: "Carbs", color: Color("blue"), current: 146, goal: 311, units: "g")
                MacroCard(title: "Protein", color: Color("pink"), current: 78, goal: 112, units: "g")
                MacroCard(title: "Fat", color: Color("purple"), current: 72, goal: 89, units: "g")
            }.onAppear(perform: {
                self.store.loadStoredUserMacroSets()
            })
            .navigationBarTitle("Summary")
        }
    }
}
