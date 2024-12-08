//
//  extension+Element.swift
//  Country
//
//  Created by MAC on 8.12.24.
//

import Foundation


extension Element {
    func localizedName(for locale: Locale) -> String {
        let localeIdentifier = locale.identifier
        if let translation = translations[localeIdentifier]?.common {
            return translation
        }
        return name.common 
    }
}
