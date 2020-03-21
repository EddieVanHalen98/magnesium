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
                    MacroCard(macroType: .calories, current: store.currentCalories, goal: store.userProfile.caloriesGoal)
                    MacroCard(macroType: .carbs, current: store.currentCarbs, goal: store.userProfile.carbsGoal)
                    MacroCard(macroType: .protein, current: store.currentProtein, goal: store.userProfile.proteinGoal)
                    MacroCard(macroType: .fat, current: store.currentFat, goal: store.userProfile.fatGoal)
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
