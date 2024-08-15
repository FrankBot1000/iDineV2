//
//  Favorites.swift
//  iDineV2
//
//  Created by Super Grover on 2024-08-14.
//

import SwiftUI

class Favorites: ObservableObject {
    @Published var items = [MenuItem]()
    
    
    func add(item: MenuItem) {
        items.append(item)
    }
    
    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
    
}


extension Favorites {
    
    convenience init(items: [MenuItem]) {
        self.init()
        self.items = items
    }
    
}
