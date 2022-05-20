//
//  FilterRestaurantView.swift
//  FoodFolk
//
//  Created by admin on 5/16/22.
//

import SwiftUI

struct FilterRestaurantView: View {
    
    
    @State var restaurant: Restaurant
    @State var clickBtn: Bool = true
    @State var selectPriceRangeIndex = 0
    @State var showAllRestaurantsView: Bool = false

    
    
    @Environment(\.presentationMode) private var presentationMode
    
    
    
    var body: some View {
        
        VStack {
            
            
            List{
                
                ForEach(filteredRestaurant) { restaurantLists in
                    
                    
                    VStack (alignment: .leading) {
                        
                        Text ("\(restaurantLists.name)")
                        Text ("Cuisine Type: \(restaurantLists.cuisineType.rawValue)")
                        Text ("Rating: \(restaurantLists.rating, specifier: "%.1f")")
                    }.padding(5)
                    
                }//end of ForEach
            }// End of List
            
            Text("What price range will you prefer?")
                .padding(.bottom, 20)
            
            
            ForEach (Prices.allCases, id: \.self){ price in
                NavigationLink(isActive: $showAllRestaurantsView) {
                    
   
                    RestaurantCard(restaurantList: restaurant, favoriteState: $clickBtn)
                    

                    
                } label: {
                    
                    EmptyView()
                    
                }
                
                Button {
                    
                    
                    filterByPriceRange(priceRange: "\(price.rawValue)")
                    
                    showAllRestaurantsView = true
                    
                } label: {
                    Text("\(price.rawValue)")
                }
                
                
            }//End of forEach FOR CUISINETYPE
            
        }//EndOFVStack
    }
}

struct FilterRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        FilterRestaurantView(restaurant: (Restaurant(name: "", cuisineType: .mexican, priceRange: .one, rating: 4.5, image: "")))
    }
}