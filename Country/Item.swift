//
//  Item.swift
//  Country
//
//  Created by MAC on 8.12.24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var region: String
    var name: String
    init(region: String, name: String) {
        self.region = region
        self.name = name
    }
}
