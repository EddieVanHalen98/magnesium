//
//  AddFoodView.swift
//  magnesium
//
//  Created by James Saeed on 26/12/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import SwiftUI

struct AddFoodView: View {
    
    @EnvironmentObject var store: MacroSetStore
    
    @ObservedObject var viewModel = AddFoodViewModel()
    
    @Binding var isPresented: Bool
    
    @State var searchQuery = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchText: $searchQuery, onCommit: {
                    self.viewModel.search(query: self.searchQuery)
                })
                List(viewModel.searchResults, id: \.self) { foodItem in
                    NavigationLink(destination: ConfirmAddFoodView(isPresented: self.$isPresented, foodItem: foodItem)) {
                        FoodSearchResultView(foodItem: foodItem)
                    }
                }
            }
            .navigationBarTitle("Add Food")
            .navigationBarItems(trailing: NavigationLink(destination: ScanFoodView(), label: {
                Image(systemName: "camera.viewfinder")
                .font(.system(size: 24, weight: .light, design: .default))
            }))
        }.accentColor(Color("primary"))
    }
}

private struct FoodSearchResultView: View {
    
    let foodItem: FoodItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(foodItem.label)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .opacity(0.9)
            if foodItem.brand != nil {
                Text(foodItem.brand!)
                    .font(.system(size: 17, weight: .medium, design: .rounded))
                    .opacity(0.75)
            }
        }.padding(.vertical, 8)
        .padding(.leading, 8)
    }
}
