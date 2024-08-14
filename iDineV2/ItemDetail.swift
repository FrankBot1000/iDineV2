//
//  ItemDetail.swift
//  iDineV2
//
//  Created by Super Grover on 2024-08-14.
//

import SwiftUI

struct ItemDetail: View {
    let item: MenuItem
    
    var body: some View {
        VStack {
            Image(item.mainImage)
            Text(item.description)
        }
        .navigationTitle(item.name)
    }
}

#Preview {
    NavigationStack {
        ItemDetail(item: MenuItem.example)
    }
    
}
