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
                if !favorites.items.filter({$0.itemType == .breakfast}).isEmpty {
                    Section("Breakfast") {
                        ForEach(favorites.items.filter{$0.itemType == .breakfast}) { favorite in
                            HStack {
                                NavigationLink(value: favorite) {
                                    ItemRow(item: favorite)
                                }
                            }
                            
                        }
                    }
                }
                
                if !favorites.items.filter({$0.itemType == .mains}).isEmpty {
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
                
                if !favorites.items.filter({$0.itemType == .dessert}).isEmpty {
                    Section("Desserts") {
                        ForEach(favorites.items.filter{$0.itemType == .dessert}) { favorite in
                            HStack {
                                NavigationLink(value: favorite) {
                                    ItemRow(item: favorite)
                                }
                            }
                            
                        }
                    }
                }
                
                if !favorites.items.filter({$0.itemType == .drinks}).isEmpty {
                    Section("Drinks") {
                        ForEach(favorites.items.filter{$0.itemType == .drinks}) { favorite in
                            HStack {
                                NavigationLink(value: favorite) {
                                    ItemRow(item: favorite)
                                }
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
