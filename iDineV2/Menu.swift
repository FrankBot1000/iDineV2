//
//  Menu.swift
//  iDine
//
//  Created by Fern Botelho on 2024-08-14.
//  Copyright © 2019 Fern Botelho. All rights reserved.
//
//  A version of the "iDine" App from the book "SwiftUI by Example" by Paul Hudson that includes code challenges.
//
//  Original version of "iDine" created by Paul Hudson on 23/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.

import SwiftUI

enum ItemType: String, CaseIterable, Codable {
    case breakfast  = "Breakfast"
    case mains      = "Mains"
    case dessert    = "Dessert"
    case drinks     = "Drinks"
}


struct MenuSection: Codable, Identifiable {
    var id: UUID
    var name: String
    var items: [MenuItem]
}

struct MenuItem: Codable, Hashable, Equatable, Identifiable {
    var id: UUID
    var name: String
    var photoCredit: String
    var price: Int
    var restrictions: [String]
    var description: String
    
    var itemType: ItemType?     // Make an optional; will be nil for decoded menu items in 'menu.json'.

    var mainImage: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }

    var thumbnailImage: String {
        "\(mainImage)-thumb"
    }

    #if DEBUG
    static let example = MenuItem(id: UUID(), name: "Maple French Toast", photoCredit: "Joseph Gonzalez", price: 6, restrictions: ["G", "V"], description: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you…")
    
    static let examples = [
        MenuItem(id: UUID(), name: "Maple French Toast", photoCredit: "Joseph Gonzalez", price: 6, restrictions: ["G", "V"], description: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you…", itemType: .breakfast),
        
        MenuItem(id: UUID(), name: "Stack-o-Pancakes", photoCredit: "Joseph Gonzalez", price: 8, restrictions: ["D", "G", "V"], description: "What do you get? Pancakes! How many do you get? One metric stack! That's equivalent to 1000 millistacks, or a tenth of a kilostack. In short, you get a lot of pancakes.", itemType: .breakfast),
        
        MenuItem(id: UUID(), name: "Fresh-baked Croissant", photoCredit: "Kavita Joshi Rai", price: 3, restrictions: ["D", "G"], description: "This is just a regular croissant that we buy in bulk from a frozen foods supermarket, but we needed some sort of adjective to justify our price. So, it was either \"fresh-baked\" or \"authentic Parisian\", and our legal team thinks the latter is probably going to land us in hot water.", itemType: .breakfast),
        
        MenuItem(id: UUID(), name: "Penne Carbonara", photoCredit: "Brooke Lark", price: 15, restrictions: ["D", "G"], description: "What's better than a creamy artisinal[1] pasta that has been hand-made[2] by our chefs[3]? All that with bacon, of course! ([1] Shop bought; [2] Hand-purchased; [3] wait staff)", itemType: .mains),
        
        MenuItem(id: UUID(), name: "Mushroom Tagliatelle", photoCredit: "Eaters Collective", price: 12, restrictions: ["D", "G", "V"], description: "If you're the kind of fun guy (sorry not sorry) that likes salami-filled Italian food with a twist, this is the perfect dish for you. The twist? We lied about the meat.", itemType: .mains),
    ]
    #endif
}
