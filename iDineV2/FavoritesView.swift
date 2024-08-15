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
                Section("Breakfast") {
                    ForEach(favorites.items.filter{$0.itemType == .breakfast}) { favorite in
                        HStack {
                            NavigationLink(value: favorite) {
                                ItemRow(item: favorite)
                            }
                        }
                        
                    }
                }
                Section("Mains") {
                    ForEach(favorites.items.filter{$0.itemType == .mains}) { favorite in
                        HStack {
                            NavigationLink(value: favorite) {
                                ItemRow(item: favorite)
                            }
                        }
                        
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
    
    
    func deleteItems(at offsets: IndexSet) {
        favorites.items.remove(atOffsets: offsets)
    }
}

#Preview {
    FavoritesView()
        .environmentObject(Favorites(items: MenuItem.examples))
}
