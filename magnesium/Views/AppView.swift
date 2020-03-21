//
//  AppView.swift
//  magnesium
//
//  Created by James Saeed on 19/03/2020.
//  Copyright © 2020 James Saeed. All rights reserved.
//

import SwiftUI

struct AppView: View {
    
    var body: some View {
        TabView {
            SummaryView()
                .tabItem {
                    Image(systemName: "doc.plaintext")
                    Text("Summary")
                }
            MealsView()
                .tabItem {
                    Image(systemName: "chart.pie")
                    Text("Meals")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }.accentColor(Color("primary"))
        .edgesIgnoringSafeArea(.top)
    }
}
