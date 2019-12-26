//
//  SearchBar.swift
//  magnesium
//
//  Created by James Saeed on 26/12/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import SwiftUI

struct SearchBar: View {

    @Binding var searchText: String
    
    let onCommit: () -> ()
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass").foregroundColor(.secondary)
            TextField("Search", text: $searchText, onCommit: {
                self.onCommit()
            })
            Button(action: {
                self.searchText = ""
            }) {
                Image(systemName: "xmark.circle.fill").foregroundColor(.secondary).opacity(searchText == "" ? 0 : 1)
            }
        }.padding(.top, 8)
        .padding(.bottom, 4)
        .padding(.horizontal, 16)
    }
}

/*
struct SearchBar: UIViewRepresentable {

    @Binding var searchText: String

    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $searchText)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar,
                      context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = searchText
    }
}
*/
