//
//  NetWorkModel.swift
//  Country
//
//  Created by MAC on 8.12.24.
//

import Foundation
// MARK: - WelcomeElement


struct Element: Hashable, Codable {
    
    let name: Name
    let tld: [String]?
    let cca2: String
    let ccn3: String?
    let cca3: String
    let independent: Bool?
    let status: Status
    let unMember: Bool
    let currencies: [String: Currency]?
    let idd: Idd
    let capital: [String]?
    let altSpellings: [String]
    let region: Region
    let languages: [String: String]?
    let translations: [String: Translation]
    let latlng: [Double]
    let landlocked: Bool
    let area: Double
    let demonyms: Demonyms?
    let flag: String
    let maps: Maps
    let population: Int
    let car: Car
    let timezones: [String]
    let continents: [Continent]
    let flags: Flags
    let coatOfArms: CoatOfArms
    let startOfWeek: StartOfWeek
    let capitalInfo: CapitalInfo
    let cioc: String?
    let subregion: String?
    let fifa: String?
    let borders: [String]?
    let gini: [String: Double]?
    let postalCode: PostalCode?
}

// MARK: - CapitalInfo
struct CapitalInfo: Hashable, Codable {
    let latlng: [Double]?
}

// MARK: - Car
struct Car:  Hashable,Codable {
    let signs: [String]?
    let side: Side
}

enum Side: String, Hashable, Codable {
    case sideLeft = "left"
    case sideRight = "right"
}

// MARK: - CoatOfArms
struct CoatOfArms: Hashable, Codable {
    let png: String?
    let svg: String?
}

enum Continent:  String, Hashable, Codable {
    case africa = "Africa"
    case antarctica = "Antarctica"
    case asia = "Asia"
    case europe = "Europe"
    case northAmerica = "North America"
    case oceania = "Oceania"
    case southAmerica = "South America"
}

// MARK: - Currency
struct Currency: Hashable, Codable {
    let name, symbol: String
}

// MARK: - Demonyms
struct Demonyms:  Hashable, Codable {
    let eng: Eng
    let fra: Eng?
}

// MARK: - Eng
struct Eng: Hashable, Codable {
    let f, m: String
}

// MARK: - Flags
struct Flags: Hashable, Codable {
    let png: String
    let svg: String
    let alt: String?
}

// MARK: - Idd
struct Idd: Hashable,Codable {
    let root: String?
    let suffixes: [String]?
}

// MARK: - Maps
struct Maps: Hashable, Codable {
    let googleMaps, openStreetMaps: String
}

// MARK: - Name
struct Name: Hashable, Codable {
    let common, official: String
    let nativeName: [String: Translation]?
}

// MARK: - Translation
struct Translation: Hashable, Codable {
    let official, common: String
}

// MARK: - PostalCode
struct PostalCode: Hashable, Codable {
    let format: String
    let regex: String?
}

enum Region: String, Hashable, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case antarctic = "Antarctic"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
}

enum StartOfWeek: String, Hashable, Codable {
    case monday = "monday"
    case saturday = "saturday"
    case sunday = "sunday"
}

enum Status: String, Hashable, Codable {
    case officiallyAssigned = "officially-assigned"
    case userAssigned = "user-assigned"
}
