//
//  FavoritesSection.swift
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

struct FavoritesSection: View {
    let itemType: ItemType
    @ObservedObject var favorites: Favorites
    
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
