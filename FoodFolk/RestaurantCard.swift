//
//  RestaurantCard.swift
//  FoodFolk
//
//  Created by admin on 5/19/22.
//

import SwiftUI

struct RestaurantCard: View {
    var restaurantList: Restaurant
    var body: some View {
        VStack {
            List {
                Text("Nice! Looks like you are going to eat at:")
                Text("Restaurant Name:  \(restaurantList.name)")
                Text("Type of food: \(restaurantList.cuisineType.rawValue)")
                Text("Price: \(restaurantList.priceRange.rawValue)")
                Text("Rating: \(restaurantList.rating)")
                Image("\(restaurantList.image)")
                
                Spacer()
                
                
                
            }
        } //EndofList
        
        List{

            ForEach(restaurantCard) { restaurantList in
                
                
                VStack (alignment: .leading) {
                    
                    Text ("\(restaurantList.name)")
                    Text ("Cuisine Type: \(restaurantList.cuisineType.rawValue)")
                    Text ("Rating: \(restaurantList.rating, specifier: "%.1f")")
                }.padding(5)
                
            }//end of ForEach
        }// End of List
    }
}

struct RestaurantCard_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCard(restaurantList: Restaurant(name: "", cuisineType: .mexican, priceRange: .three, rating: 4.5, image: ""))
    }
}
