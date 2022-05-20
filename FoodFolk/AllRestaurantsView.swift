//
//  AllRestaurants.swift
//  FoodFolk
//
//  Created by admin on 5/18/22.
//

import SwiftUI

struct AllRestaurantsView: View {
    
    var restaurants: [Restaurant]
    
    @State var selectPriceRangeIndex = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            
            
            List{
  
                ForEach(restaurants) { restaurantLists in
                    
                    
                    VStack (alignment: .leading) {
                        
                        HStack{
                            Image("\(restaurantLists.image)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80)
                            
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                Text ("\(restaurantLists.name)")
                                Text ("Cuisine Type: \(restaurantLists.cuisineType.rawValue)")
                                Text ("\(restaurantLists.priceRange.rawValue)")
                                Text ("Rating: \(restaurantLists.rating, specifier: "%.1f")")

                            }
                        }
                        
                        
                    }.padding(5)
                    
                }//end of ForEach
            }.navigationTitle("FoodFolk")// End of List
        
        }//End of VStack
    }
}

struct AllRestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
 
        AllRestaurantsView(restaurants: Restaurant.restaurantsList)
   
    }
}
