//
//  ContentView.swift
//  BearB
//
//  Created by Mukhtaram Sulaimonov on 12/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Discover", systemImage: "eye") {
                Discover()
            }
            Tab("Explore", systemImage: "magnifyingglass") {
                Explore()
            }
            Tab("Favourites", systemImage: "heart.fill") {
                Favourites()
            }
        }
    }
}

#Preview {
    ContentView()
}
