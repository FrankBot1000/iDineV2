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
                    Text("Hello World")
                    Text("Hello World")
                    Text("Hello World")
                }
                .navigationTitle("Menu")
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
