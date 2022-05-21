//
//  HomeView.swift
//  FoodFolk
//
//  Created by admin on 5/14/22.
//

import SwiftUI

struct HomeView: View {
    
    var name: String
    @State var restaurantInfo: Restaurant
    
    var body: some View {
        
        VStack {
            
            List{
                NavigationLink {
                    RestaurantSelectionView(restaurant: restaurantInfo)
                    
                } label: {
                    Image(systemName: "questionmark.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                    
                    Text("Start your search here!")
                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                }
                
                NavigationLink {
                    FavoritePlacesView(favorite: Restaurant(name: "", cuisineType: .mexican, priceRange: .two, rating: 5.0, image: ""))
                    
                } label: {
                    Image(systemName: "star.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                    Text("Favorite Places")
                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                }
                
                NavigationLink {
                    RouletteView()
                } label: {
                    Image(systemName: "sun.max.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                    Text("Roulette Time!!!")
                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                }
                
                NavigationLink {
                    AllRestaurantsView(restaurants: Restaurant.restaurantsList)
                } label: {
                    Image("foodIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                        .foregroundColor(.white)
                    Text("Restaurants List")
                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                }
                
                
            }.navigationTitle("Welcome \(name)")
                .background(Color(hue: 0.066, saturation: 0.394, brightness: 1.0).ignoresSafeArea())
                .onAppear {
                    // Set the default to clear
                    UITableView.appearance().backgroundColor = .clear
                }
            
            
        }// End of VStack
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(name: "", restaurantInfo: (Restaurant(name: "", cuisineType: .mexican, priceRange: .four, rating: 4.6, image: "")))
    }
}
