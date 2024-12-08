//
//  DetailView.swift
//  Country
//
//  Created by MAC on 8.12.24.
//

import SwiftUI

import SwiftUI
import MapKit
import SwiftData

struct DetailView: View {
    let country: Element
    @Environment(\.modelContext) private var context
    @State var  camera:MapCameraPosition = .automatic
    @ObservedObject var viewModel: FavoriteData
    @Query var favorites: [Item]
    @State private var currentLocale = Locale.current
    @State private var isLoading = false
    var body: some View {
        NavigationStack{
            ZStack(alignment: .topLeading) {
                
                ScrollView(.vertical, showsIndicators:false){
                    AsyncImage(url: URL(string: country.flags.png)) {phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 100)
                                .cornerRadius(10)
                        }
                        else{
                            Image(systemName: "flag")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 100)
                                .cornerRadius(10)
                        }
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text("Name:")
                                    .bold()
                                
                                Text(country.localizedName(for: currentLocale))
                                    .lineLimit(2)
                                
                            }
                            
                            
                            HStack {
                                Text("Capital:")
                                    .bold()
                                
                                Text(country.capital?.first.map { $0 } ?? "")
                                    .lineLimit(2)
                            }
                            
                            
                            HStack {
                                Text("Area:")
                                    .bold()
                                
                                Text(String(country.area))
                                    .lineLimit(2)
                                
                            }
                            HStack {
                                Text("Population:")
                                    .bold()
                                
                                Text(String(country.population))
                                    .lineLimit(2)
                                
                            }
                            HStack {
                                Text("Currencies:")
                                    .bold()
                                    .foregroundColor(Color("primaryText"))
                                Text(country.currencies?.first?.value.name ?? "")
                                Text(country.currencies?.first?.value.symbol ?? "")
                                    .lineLimit(2)
                                
                            }
                            HStack {
                                Text("Languages:")
                                    .bold()
                                
                                Text(country.languages?.first?.value ?? "")
                                    .lineLimit(0)
                                
                            }
                            HStack {
                                Text("TimeZone:")
                                    .bold()
                                    .foregroundColor(Color("primaryText"))
                                Text(country.timezones.first ?? "")
                                    .lineLimit(2)
                                    .foregroundColor(Color("primaryText"))
                            }
                        }
                        
                        Map(position:$camera) {
                            Marker("Location", coordinate: CLLocationCoordinate2D(latitude: country.capitalInfo.latlng?.first ?? -54.28, longitude: country.capitalInfo.latlng?.last ?? -36.5))
                        }
                        .frame(height: 500)
                        .padding([.top], 30)
                    }
                    .padding([.top], 20)
                    
                }
                .onAppear {
                    isLoading = true
                    let location = CLLocationCoordinate2D(latitude: country.capitalInfo.latlng?.first ?? -54.28, longitude: country.capitalInfo.latlng?.last ?? -36.5)
                    let span = MKCoordinateSpan(latitudeDelta: 3, longitudeDelta: 3)
                    let region = MKCoordinateRegion(center: location, span: span)
                    camera = .region(region)
                    isLoading = false
                }
                
                .navigationBarBackButtonHidden()
                .foregroundColor(Color("primaryBackground"))
                HStack{
                    BackButton()
                        .padding([.top, .leading], 20)
                    
                    Spacer()
                    Button {
                        toggleFavorite()
                    }label:{
                        Image(systemName: isCountryFavorite(country) ? "heart.fill" : "heart")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundStyle(.red)
                            .opacity(0.8)
                    }
                    .padding([.top], 20)
                    .padding(.trailing)
                }
                
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .navigationTitle(String(localized: "app_title"))
            }
        }
        if isLoading {
            ProgressView("Loading...")
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .scaleEffect(2)
                .padding(50)
                .background(Color.white.opacity(0.7), in: RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 10)
        }
    }
    private func isCountryFavorite(_ country: Element) -> Bool {
        favorites.contains { $0.name == country.name.official }
    }
    
    private func toggleFavorite() {
        if let favorite = favorites.first(where: { $0.name == country.name.official }) {
            context.delete(favorite)
        } else {
            let favorite = Item(region: country.region.rawValue, name: country.name.official)
            context.insert(favorite)
        }
        
        do {
            try context.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
}



//#Preview {
//    DetailView()
//}
