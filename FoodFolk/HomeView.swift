//
//  HomeView.swift
//  FoodFolk
//
//  Created by admin on 5/14/22.
//

import SwiftUI

struct HomeView: View {
    
    var name: String
    @State var clickSave = true
    @State var userInput: String = ""
    @State var restaurantInfo: Restaurant
    
    var body: some View {
        
        VStack {
            
            
            Text("Welcome \(name)")
            
            List{
                
                NavigationLink {
                    RestaurantSelectionView(restaurant: $restaurantInfo)
                } label: {
                    Image(systemName: "questionmark.circle")
                    Text("Start your search here!")
                }
                
                NavigationLink {
                    FavoritePlacesView()
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
                
                
            }
        }//End of List
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(name: "Kevin", restaurantInfo: (Restaurant(name: "", cuisineType: .mexican, priceRange: .four, rating: 4.6, image: "")))
    }
}
