import SwiftUI

struct Discover: View {
    var allItems: [Item] {
        items
    }
    var creators: [Item] {
        items.filter { $0.category == .creator }
    }
    var artistCollaborations: [Item] {
        items.filter { $0.category == .artistCollaboration }
    }
    var brandCollaborations: [Item] {
        items.filter { $0.category == .brandCollaboration }
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("All Items")
                        .font(.title)
                        .bold()
                        .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(allItems, id: \.id) { item in
                                NavigationLink(destination: ItemDetailView(item: item)) {
                                    ItemCard(item: item)
                                }
                                .buttonStyle(PlainButtonStyle()) // Removes button animation
                            }
                        }
                        .padding()
                    }

                    Text("Artist Collaborations")
                        .font(.title)
                        .bold()
                        .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(artistCollaborations, id: \.id) { item in
                                NavigationLink(destination: ItemDetailView(item: item)) {
                                    ItemCard(item: item)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding()
                    }

                    // Brand Collaborations Section
                    Text("Brand Collaborations")
                        .font(.title)
                        .bold()
                        .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(brandCollaborations, id: \.id) { item in
                                NavigationLink(destination: ItemDetailView(item: item)) {
                                    ItemCard(item: item)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Discover")
        }
    }
}

struct Discover_Previews: PreviewProvider {
    static var previews: some View {
        Discover()
    }
}
