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
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("background").edgesIgnoringSafeArea(.all)
                ScrollView {
                    MacroCard(macroType: .calories, current: store.currentCalories, goal: 3456)
                    MacroCard(macroType: .carbs, current: store.currentCarbs, goal: 311)
                    MacroCard(macroType: .protein, current: store.currentProtein, goal: 112)
                    MacroCard(macroType: .fat, current: store.currentFat, goal: 89)
                }
            }
            .navigationBarTitle("Summary")
        }
        .onAppear {
            self.store.updateCurrentMacros()
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView().previewDevice("iPhone 11 Pro")
    }
}
