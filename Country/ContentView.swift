//
//  ContentView.swift
//  Country
//
//  Created by MAC on 8.12.24.
//

import SwiftUI
import SwiftData
import SDWebImageSwiftUI


struct HomeView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.filterCountry, id:\.self){
                    item in
                    NavigationLink(destination: DetailView(country: item, viewModel: FavoriteData(country: item))) {
                        HStack{
                            WebImage(url: URL(string: item.flags.png))
                                .onSuccess { image, data, cacheType in
                                }
                                .onFailure { error in
                                    
                                    print("Failed to load image: \(error)")
                                }
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                            VStack(alignment: .leading) {
                                
                                Text(item.localizedName(for: Locale(identifier: "eng")))
                                    .bold()
                                    .font(.title2)
                                   
                                
                                Text(item.region.rawValue)
                                    .padding([.top], 5)
                                   
                            }
                            .padding(20)
                        }
                    }
                }
                .buttonStyle(.plain)
            }
            .searchable(text: $viewModel.search, prompt: Text(String(localized: "search_prompt")))
            .toolbar {
                NavigationLink(destination: FavoriteView()) {
                    Text(String(localized:"favorites"))
                }
            }
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .scaleEffect(2)
                    .padding(50)
                    .background(Color.white.opacity(0.7), in: RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 10)
            }
        }
        .padding([.top], 10)
        .foregroundColor(Color("primaryBackground"))
        
        
    }
    
}

#Preview {
    HomeView()
}
