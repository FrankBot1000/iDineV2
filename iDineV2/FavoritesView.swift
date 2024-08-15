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
                ForEach(favorites.items) { favorite in
                    HStack {
                        NavigationLink(value: favorite) {
                            ItemRow(item: favorite)
                        }
                    }
                    
                }
            }
            .navigationDestination(for: MenuItem.self, destination: { menuItem in
                ItemDetail(item: menuItem)
            })
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    
    func deleteItems(at offsets: IndexSet) {
        favorites.items.remove(atOffsets: offsets)
    }
}

#Preview {
    FavoritesView()
        .environmentObject(Favorites(items: MenuItem.examples))
}
