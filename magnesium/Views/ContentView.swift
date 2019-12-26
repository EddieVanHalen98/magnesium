//
//  ContentView.swift
//  magnesium
//
//  Created by James Saeed on 13/10/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import SwiftUI

struct ContentView: View {
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
