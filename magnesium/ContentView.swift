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
            Text("Summary")
                .tabItem {
                    Image(systemName: "square.stack.3d.up")
                    Text("Summary")
                }
            Text("Meals")
                .tabItem {
                    Image(systemName: "square.stack.3d.up")
                    Text("Meals")
                }
            Text("Settings")
                .tabItem {
                    Image(systemName: "square.stack.3d.up")
                    Text("Settings")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
