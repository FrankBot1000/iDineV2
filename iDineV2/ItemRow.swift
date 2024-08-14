//
//  ItemRow.swift
//  iDineV2
//
//  Created by Super Grover on 2024-08-13.
//

import SwiftUI

struct ItemRow: View {
    let item: MenuItem
    
    var body: some View {
        Text(item.name)
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
