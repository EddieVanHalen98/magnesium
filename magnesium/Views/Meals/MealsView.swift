//
//  MealsView.swift
//  magnesium
//
//  Created by James Saeed on 13/10/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import SwiftUI

struct MealsView: View {
    
    @EnvironmentObject var store: MacroSetStore
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("background").edgesIgnoringSafeArea(.all)
                ScrollView {
                    MealCard(meal: .breakfast)
                    MealCard(meal: .lunch)
                    MealCard(meal: .dinner)
                    MealCard(meal: .snacks)
                }
            }
            .navigationBarTitle("Meals")
        }.accentColor(Color("primary"))
    }
}
