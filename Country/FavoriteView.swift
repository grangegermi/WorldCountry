//
//  FavoriteView.swift
//  Country
//
//  Created by MAC on 8.12.24.
//

import SwiftUI
import SwiftData

struct FavoriteView: View {
    @StateObject private var viewModel =  FavoritesViewModel()
    @Query var favorites: [Item]
    @Environment(\.modelContext) private var context
    var body: some View {
        List{
            ForEach(favorites){item in
                HStack{
                    Text(item.name)
               
                    Spacer()
                    Button(role: .destructive) {
                        deleteFavorite(country: item)
                    } label: {
                        
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                }
            }
        }
        .navigationBarTitle(String(localized: "app_title"))
        
        
    }
    private func deleteFavorite(country: Item) {
        context.delete(country)
        do {
            try context.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
}

#Preview {
    FavoriteView()
}
