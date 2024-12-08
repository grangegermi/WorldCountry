//
//  DateModel.swift
//  Country
//
//  Created by MAC on 8.12.24.
//

import Foundation

import SwiftUI
import SwiftData

class FavoriteData: ObservableObject {
    let country: Element
    init(country:Element){
        self.country = country
    }
    
    func addFavorite(context: ModelContext){
        let favorite = Item(region: country.region.rawValue,
                            name: country.name.official)
        context.insert(favorite)
        do{
            try context.save()
        }
        catch{
            print("Error")
        }
    }
}
