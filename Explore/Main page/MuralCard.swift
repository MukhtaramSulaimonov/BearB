//
//  MuralCard.swift
//  BearB
//
//  Created by Mukhtaram Sulaimonov on 12/12/24.
//

import SwiftUI

struct MuralCard: View {
    let mural: Mural
    var body: some View {
        ZStack{
            Image(mural.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .cornerRadius(10)
                .clipped()
            VStack(alignment: .leading) {
                Text(mural.title)
                    .foregroundColor(.black)
                Text(mural.creators)
                    .foregroundColor(.black)
            }
            .background(Color.gray.opacity(0.3))
            .offset(x: -10, y: 90)
            
        }
        .padding()
        .background(Color(.systemBackground)) // Card background
        .cornerRadius(12) // Rounded corners
        .shadow(radius: 3)
    }
        
}

#Preview {
    MuralCard(mural: Mural(imageName: "b1",creators:"JORIT, MONO GONZÁLEZ", title: "Salvador Allende"));
}
