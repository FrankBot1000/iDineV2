//
//  ItemDetail.swift
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

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    @EnvironmentObject var favorites: Favorites
    
    let item: MenuItem
    var isFavorite = false
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(.black)
                    .font(.caption)
                    .foregroundStyle(.background, .white)   //...replaces .foregroundColor(...), which is deprecated.
                    .offset(x: -5, y: -5)
            }
            
            Text(item.description)
                .padding()
            
            Button("Order This") {
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)
            .font(.custom("Times New Roman", size: 20.0))
            .tint(.green)   // background color of Button
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            if !isFavorite {
                Button("Heart", systemImage: "heart") {
                    favorites.add(item: item)
                }
            }
        })
    }
}

#Preview {
    NavigationStack {
        ItemDetail(item: MenuItem.example)
            .environmentObject(Order())
    }
    
}
