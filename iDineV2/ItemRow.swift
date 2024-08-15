//
//  ItemRow.swift
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

struct ItemRow: View {
    let item: MenuItem
    let colors: [String: Color] = [
        "D": .purple,
        "G": .black,
        "N": .red,
        "S": .blue,
        "V": .green
    ]
    
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(.gray, lineWidth: 2))
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }
            Spacer()
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(colors[restriction, default: .black])
                    .clipShape(Circle())
                    .foregroundStyle(.background, .white)   // ...use instead of deprecated .foregroundColor(.white).
            }
        }
    }
}

#Preview {
    ItemRow(item: MenuItem.example)
}


///// The older way, as compared to using '#Preview'.
//struct ItemRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemRow(item: MenuItem.example)
//    }
//}
