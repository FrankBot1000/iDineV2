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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            NavigationStack {
                List {
                    ForEach(menu) { section in
                        Section(section.name) {
                            ForEach(section.items) { item in
                                NavigationLink {
                                    ItemDetail(item: item)
                                } label: {
                                    ItemRow(item: item)
                                }
                                
                            }
                        }
                    }
                }
                .navigationTitle("Menu")
                .listStyle(.grouped)
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
