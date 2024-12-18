import SwiftUI


struct ItemDetailView: View {
    let item: Item

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ZStack(alignment: .bottomLeading) {
                    Image(item.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300) 
                        .clipped()
                        .cornerRadius(12)
                        .frame(maxWidth: .infinity, alignment: .center)
                        

                    LinearGradient(
                        gradient: Gradient(colors: [.black.opacity(0.7), .clear]),
                        startPoint: .bottom, endPoint: .top
                    )
                    .frame(height: 150)
                    .cornerRadius(12)
                    
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(item.title)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                        Text(item.category.rawValue.capitalized)
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding()
                }
                .padding(.horizontal)

         
                HStack {
                    Text("Price: \(item.price)")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.primary)
                    Spacer()
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)

              
                VStack(alignment: .leading, spacing: 8) {
                    Text("Description")
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text(item.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)
                
                Spacer()
            }
        }
        .navigationTitle(item.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetailView(item: Item(
                imageName: "b1",
                title: "Tyson",
                category: .mural,
                price: "$75",
                description: "A mural designed with AI techniques, showcasing the interplay between vibrant colors and precise artistic techniques.A mural designed with AI techniques, showcasing the interplay between vibrant colors and precise artistic techniques.A mural designed with AI techniques, showcasing the interplay between vibrant colors and precise artistic techniques.A mural designed with AI techniques, showcasing the interplay between vibrant colors and precise artistic techniques.A mural designed with AI techniques, showcasing the interplay between vibrant colors and precise artistic techniques.A mural designed with AI techniques, showcasing the interplay between vibrant colors and precise artistic techniques.A mural designed with AI techniques, showcasing the interplay between vibrant colors and precise artistic techniques.A mural designed with AI techniques, showcasing the interplay between vibrant colors and precise artistic techniques.A mural designed with AI techniques, showcasing the interplay between vibrant colors and precise artistic techniques.A mural designed with AI techniques, showcasing the interplay between vibrant colors and precise artistic techniques.A mural designed with AI techniques, showcasing the interplay between vibrant colors and precise artistic techniques.A mural designed with AI techniques, showcasing the interplay between vibrant colors and precise artistic techniques."
            ))
        }
    }
}
