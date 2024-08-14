//
//  ContentView.swift
//  iDineV2
//
//  Created by Super Grover on 2024-08-13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            List {
                Text("Hello World")
                Text("Hello World")
                Text("Hello World")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
