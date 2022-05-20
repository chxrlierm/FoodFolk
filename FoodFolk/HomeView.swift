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
                    Text("Start your search here!")
                }
                
                NavigationLink {
                    FavoritePlacesView(favorite: Restaurant(name: "", cuisineType: .mexican, priceRange: .two, rating: 5.0, image: ""))
                } label: {
                    Image(systemName: "star.circle")
                    Text("Favorite Places")
                }
                
                NavigationLink {
                    RouletteView()
                } label: {
                    Image(systemName: "sun.max.circle")
                    Text("Random Roulette!")
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
                }
                
                
            }.navigationTitle("Welcome \(name)")
            
            
        }// End of VStack
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(name: "", restaurantInfo: (Restaurant(name: "", cuisineType: .mexican, priceRange: .four, rating: 4.6, image: "")))
    }
}
