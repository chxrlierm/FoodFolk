//
//  RestaurantSelectionView.swift
//  FoodFolk
//
//  Created by admin on 5/13/22.
//

import SwiftUI

struct RestaurantSelectionView: View {
    var restaurant: Restaurant
    @State var clickBtn: Bool = true
    @State var showAllRestaurantsView: Bool = false
    
    
    

    var body: some View {
        
        VStack {
            Text("Let's find you the best option where to eat!")
            Text("Starving is not cool!")
                .padding(.bottom, 20)
            Text("Which type of food would you like to eat?")
                .padding(.bottom, 20)
            
            ForEach (CusineTypes.allCases, id: \.self){ restType in
                NavigationLink(isActive: $showAllRestaurantsView) {
                    
         
                    
                    FilterRestaurantView(restaurant: restaurant)
                   


                    
                } label: {

                    EmptyView()
                    
                }
                
                Button {
                    
                    
                    filterByCousineType(cuisineType: "\(restType.rawValue)")
                        
                    showAllRestaurantsView = true
                    
                } label: {
                    Text("\(restType.rawValue)")
                }

      
            }//End of forEach FOR CUISINETYPE
            
            Spacer()
                        
        }//End of MainVStack
    }
}


struct RestaurantSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantSelectionView(restaurant: (Restaurant(name: "Carlos", cuisineType: .mexican, priceRange: .three, rating: 4.6, image: "")))
    }
}
