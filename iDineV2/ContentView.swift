//
//  ContentView.swift
//  iDineV2
//
//  Created by Super Grover on 2024-08-13.
//

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
