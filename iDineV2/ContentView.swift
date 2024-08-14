//
//  ContentView.swift
//  iDineV2
//
//  Created by Super Grover on 2024-08-13.
//

import SwiftUI

struct ContentView: View {
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
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
