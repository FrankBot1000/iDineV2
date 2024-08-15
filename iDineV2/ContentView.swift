//
//  ContentView.swift
//  iDineV2
//
//  Created by Fern Botelho on 2024-08-14.
//  Copyright © 2019 Fern Botelho. All rights reserved.
//
//  A version of the "iDine" App from the book "SwiftUI by Example" by Paul Hudson that includes code challenges.
//
//  Original version of "iDine" created by Paul Hudson on 23/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.

import SwiftUI

struct ContentView: View {
    
    var menu = {
        var menuSections = Bundle.main.decode([MenuSection].self, from: "menu.json")
        // Set the itemType of each of the menuItems of each section:
        for (sectionIndex, section) in menuSections.enumerated() {
            section.items.enumerated().forEach {(menuItemIndex, _) in
                menuSections[sectionIndex].items[menuItemIndex].itemType = ItemType(rawValue: section.name) ?? .breakfast
            }
        }
        return menuSections
    }()
    
    
    
    var body: some View {
        VStack {
            NavigationStack {
                List {
                    ForEach(menu) { section in
                        Section(section.name) {
                            ForEach(section.items) { item in
                                NavigationLink(value: item) {
                                    ItemRow(item: item)
                                }
                            }
                        }
                    }
                }
                .navigationDestination(for: MenuItem.self, destination: { item in
                    ItemDetail(item: item)
                })
                .navigationTitle("Menu")
//                .navigationBarTitleDisplayMode(.inline)
                .listStyle(.grouped)
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
