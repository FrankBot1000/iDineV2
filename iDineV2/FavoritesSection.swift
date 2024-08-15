//
//  FavoritesSection.swift
//  iDineV2
//
//  Created by Super Grover on 2024-08-15.
//

import SwiftUI

struct FavoritesSection: View {
    let itemType: ItemType
    let favorites: Favorites
    
    var body: some View {
        Section(itemType.rawValue) {
            ForEach(favorites.items.filter{$0.itemType == itemType}) { favorite in
                HStack {
                    NavigationLink(value: favorite) {
                        ItemRow(item: favorite)
                    }
                }
                
            }
        }
    }
}

#Preview {
    FavoritesSection(itemType: .breakfast, favorites: Favorites(items: MenuItem.examples))
}
