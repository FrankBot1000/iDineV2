//
//  MainView.swift
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

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
            
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
            
        }
    }
}

#Preview {
    MainView()
        .environmentObject(Order())
}
