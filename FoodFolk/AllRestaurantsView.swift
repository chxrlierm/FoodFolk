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
            
            ZStack {
                
                List{
                    
                    ForEach(restaurants) { restaurantLists in
                        
                        
                        VStack (alignment: .leading) {
                            
                            HStack{
                                Image("\(restaurantLists.image)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                    .padding(.trailing, 10)
               
                                VStack(alignment: .leading) {
                                    Text ("\(restaurantLists.name)")
                                    Text ("Cuisine Type: \(restaurantLists.cuisineType.rawValue)")
                                    Text ("Price: \(restaurantLists.priceRange.rawValue)")
                                    Text ("Rating: \(restaurantLists.rating, specifier: "%.1f")")
                                    
                                }//End of VStack for Text
                            }//End of HStack
                            
                        }.padding(10)
                        
                    }//end of ForEach
                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)
                    .listRowBackground(Rectangle().foregroundColor(Color(hue: 0.066, saturation: 0.594, brightness: 1.0)))
                    
                }.navigationTitle("FoodFolk")
            }// End of List
            
            
           
            
        }//End of VStack
        
    }
}

struct AllRestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        
        AllRestaurantsView(restaurants: Restaurant.restaurantsList)
        
        
    }
}
