//
//  ContentView.swift
//  magnesium
//
//  Created by James Saeed on 13/10/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var store: MacroSetStore
    
    @State var isRegistered: Bool = false
    
    var body: some View {
        Group {
            if isRegistered {
                AppView()
            } else {
                RegistrationView(isRegistered: $isRegistered)
            }
        }.onAppear {
            self.isRegistered = DataGateway.shared.getUserProfile() != nil
            if self.isRegistered { self.store.load() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
