//
//  ItemCard.swift
//  BearB
//
//  Created by Mukhtaram Sulaimonov on 16/12/24.
//

import SwiftUI

struct ItemCard: View {
    let item: Item
    var body: some View {
        VStack {
            Image(item.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .cornerRadius(10)
                .clipped()
            Text(item.title)
                .foregroundColor(.black)
                .font(.headline)
                .multilineTextAlignment(.center) // Allows text to center align
                .lineLimit(nil) // Removes the line limit
                .frame(maxWidth: 120)
            
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(12)
                .shadow(radius: 3)
                .frame(width: 150, height: 170)
    }
}

