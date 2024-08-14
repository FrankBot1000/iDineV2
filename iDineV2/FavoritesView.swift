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
                ForEach(favorites.favorites) { favorite in
                    HStack {
                        Text(favorite.name)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    FavoritesView()
}
