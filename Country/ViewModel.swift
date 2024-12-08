//
//  ViewModel.swift
//  Country
//
//  Created by MAC on 8.12.24.
//

import Foundation

@MainActor
final class ViewModel: ObservableObject {
  
    // MARK: - Properties
//    @Environment(\.modelContext) private var context
    @Published var countries: [Element] = []
    @Published var search = ""
    @Published var isLoading: Bool = false

//
    var filterCountry:[Element] {
        guard !search.isEmpty else {return countries}
        return countries.filter { country in
            country.name.common.lowercased().contains(search.lowercased())
        }
    }
    // MARK: - initializator
    init(){
        fetchCountry()
    }
    
    // MARK: - Methods
    func fetchCountry ()  {
        Task{
            isLoading = true
            do{
                let country  = try await NetwokrManager.shared.getCountry()
                countries = country
                
            }catch {
                if let error = error as? NetworkError{
                    print(error)
                }
                
            }
            isLoading = false
        }
    }
   
}
