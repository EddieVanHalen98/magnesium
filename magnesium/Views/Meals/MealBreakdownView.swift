//
//  MealBreakdownView.swift
//  magnesium
//
//  Created by James Saeed on 14/12/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import SwiftUI

struct MealBreakdownView: View {
    
    @EnvironmentObject var store: MacroSetStore
    
    @State var isAddFoodPresented = false
    
    let mealType: MealType
    
    var body: some View {
        ZStack {
            Color("background").edgesIgnoringSafeArea(.all)
            ScrollView {
                if !store.macroSets.filter({ $0.meal == mealType }).isEmpty {
                    MealMacroCard(macroType: .calories, macroSets: store.macroSets.filter({ $0.meal == mealType }))
                    MealMacroCard(macroType: .carbs, macroSets: store.macroSets.filter({ $0.meal == mealType }))
                    MealMacroCard(macroType: .protein, macroSets: store.macroSets.filter({ $0.meal == mealType }))
                    MealMacroCard(macroType: .fat, macroSets: store.macroSets.filter({ $0.meal == mealType }))
                } else {
                    Text("Nothing has been added for \(mealType.rawValue)")
                        .modifier(CardLabelFont())
                        .opacity(0.5)
                        .padding(16)
                }
            }
        }
        .navigationBarTitle(mealType.rawValue.capitalized)
        .navigationBarItems(trailing: Button(action: {
            self.isAddFoodPresented = true
        }, label: {
            Text("Add")
        }))
        .sheet(isPresented: $isAddFoodPresented) {
            AddFoodView(isPresented: self.$isAddFoodPresented)
                .environmentObject(self.store)
        }
    }
}
