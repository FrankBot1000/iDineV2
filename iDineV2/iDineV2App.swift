//
//  iDineV2App.swift
//  iDineV2
//
//  Created by Super Grover on 2024-08-13.
//

import SwiftUI

@main
struct iDineV2App: App {
    @StateObject var order      = Order()
    @StateObject var favorites  = Favorites()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
                .environmentObject(favorites)
        }
    }
}
