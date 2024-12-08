//
//  ModelForFavorites.swift
//  Country
//
//  Created by MAC on 8.12.24.
//

import Foundation

import SwiftUI
import SwiftData

class FavoritesViewModel: ObservableObject {
    
    @Query var favorites: [Item]
    func deleteFavorite(country:Item, context: ModelContext) {
        context.delete(country)
        do {
            try context.save()
        } catch {
            print("Error")
        }
    }
}
