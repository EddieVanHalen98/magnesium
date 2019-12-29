//
//  ConfirmAddFoodView.swift
//  magnesium
//
//  Created by James Saeed on 26/12/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import SwiftUI

struct ConfirmAddFoodView: View {
    
    @EnvironmentObject var store: MacroSetStore
    
    @Binding var isPresented: Bool
    
    let foodItem: FoodItem
    
    @State var amount = "100"
    
    @State var calories: Double = 0
    @State var carbs: Double = 0
    @State var protein: Double = 0
    @State var fat: Double = 0
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 24) {
                FoodNutrientView(nutrientType: .calories,
                                 amount: $calories)
                FoodNutrientView(nutrientType: .carbs,
                                 amount: $carbs)
                FoodNutrientView(nutrientType: .protein,
                                 amount: $protein)
                FoodNutrientView(nutrientType: .fat,
                                 amount: $fat)
            }.padding(.top, 24)
            
            AmountTextField(amount: $amount, foodLabel: foodItem.label, onCommit: {
                self.updateNutrients()
            }).padding(.horizontal, 32)
            .padding(.top, 16)
            
            Spacer()
        }.onAppear(perform: {
            self.updateNutrients()
        })
        .navigationBarTitle(foodItem.label)
        .navigationBarItems(trailing: Button(action: {
            self.addFood()
        }, label: {
            Text("Add")
        }))
    }
    
    func addFood() {
        let macros = Macros(calories: calories, carbs: carbs, protein: protein, fat: fat)
        let macroSet = MacroSet(for: foodItem.label, at: .breakfast, with: macros)
        
        store.addMacroSet(macroSet)
        
        isPresented = false
    }
    
    func updateNutrients() {
        if let doubleAmount = Double(amount) {
            calories = foodItem.nutrients.calories! * doubleAmount * 0.01
            carbs = foodItem.nutrients.carbs! * doubleAmount * 0.01
            protein = foodItem.nutrients.protein! * doubleAmount * 0.01
            fat = foodItem.nutrients.fat! * doubleAmount * 0.01
        }
    }
}

private struct FoodNutrientView: View {
    
    let nutrientType: MacroType
    
    @Binding var amount: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            CardTitle(title: nutrientType.rawValue.capitalized,
                      color: Color(nutrientType.rawValue))
            MacroCardLabel(amount: amount, units: nutrientType.rawValue.units)
        }
    }
}
