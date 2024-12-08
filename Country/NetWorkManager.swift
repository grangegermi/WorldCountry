//
//  NetWorkManager.swift
//  Country
//
//  Created by MAC on 8.12.24.
//

import Foundation

final class NetwokrManager {
    
    // MARK: - properties
    static let shared = NetwokrManager()
    private  let url = "https://restcountries.com/v3.1/all"
    private let decoder = JSONDecoder()
    
    // MARK: - initializator
    private init(){
        
    }
    
    
    // MARK: - Methods
    
    func getCountry() async throws -> [Element]{
        
        guard let url = URL(string: url) else {throw NetworkError.invalid}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {throw NetworkError.invalidResponse}
        do {
            return try decoder.decode([Element].self, from: data)
            
        } catch{
            throw NetworkError.invalidData
            
        }
    }
}
