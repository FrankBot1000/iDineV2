//
//  Favorites.swift
//  iDineV2
//
//  Created by Super Grover on 2024-08-14.
//

import SwiftUI

class Favorites: ObservableObject {
    @Published var favorites = [MenuItem]()
    
    
    func add(item: MenuItem) {
        favorites.append(item)
    }
    
    func remove(item: MenuItem) {
        if let index = favorites.firstIndex(of: item) {
            favorites.remove(at: index)
        }
    }
    
    
}
