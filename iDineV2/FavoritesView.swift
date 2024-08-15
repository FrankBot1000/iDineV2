//
//  FavoritesView.swift
//  iDineV2
//
//  Created by Super Grover on 2024-08-14.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var items: Favorites
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items.favorites) { favorite in
                    HStack {
                        Text(favorite.name)
                    }
                    
                }
            }
        }
    }
    
    
    func deleteItems(at offsets: IndexSet) {
        items.favorites.remove(atOffsets: offsets)
    }
}

#Preview {
    FavoritesView()
}
