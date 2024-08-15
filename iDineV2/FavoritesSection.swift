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
            .onDelete(perform: { indexSet in
                favorites.items.remove(atOffsets: indexSet)
            })
            // Above is more clear, but could have done:
//                .onDelete{favorites.items.remove(atOffsets: $0)}
        }
    }
    
    
    @available(*, deprecated, message: "For .onDelete modifier, use closure '{indexSet in favorites.items.remove(atOffsets: indexSet)}' instead.")
    func deleteItems(at offsets: IndexSet) {
        favorites.items.remove(atOffsets: offsets)
    }
}

#Preview {
    FavoritesSection(itemType: .breakfast, favorites: Favorites(items: MenuItem.examples))
}
