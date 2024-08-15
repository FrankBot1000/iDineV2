//
//  FavoritesView.swift
//  iDineV2
//
//  Created by Super Grover on 2024-08-14.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        NavigationStack {
            List {
                let itemTypes = ItemType.allCases
                ForEach(itemTypes, id: \.self) { itemType in
                    if !favorites.items.filter({$0.itemType == itemType}).isEmpty {
                        FavoritesSection(itemType: itemType, favorites: favorites)
                    }
                }
            }
            .navigationDestination(for: MenuItem.self, destination: { menuItem in
                ItemDetail(item: menuItem, isFavorite: true)
            })
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

#Preview {
    FavoritesView()
        .environmentObject(Favorites(items: MenuItem.examples))
}
