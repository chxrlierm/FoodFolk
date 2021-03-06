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
                .font(.system(size: 18, weight: .bold, design: .monospaced))
                .foregroundColor(.black)
                .padding(.bottom)
                
            
            Text("Starving is not cool!")
                .font(.system(size: 22, weight: .heavy, design: .monospaced))
                .foregroundColor(Color(hue: 0.066, saturation: 0.594, brightness: 0.948))
                .padding(.bottom, 20)
                

            Text("Which type of food would you like to eat?")
                .font(.system(size: 18, weight: .semibold, design: .default))
                .padding(.bottom, 20)
            
            ForEach (CuisineType.allCases, id: \.self){ restType in
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
                        .font(.system(size: 25, weight: .heavy, design: .monospaced))
                        
                }
                .frame(width: 150, height: 45)
                .foregroundColor(.white)
                .background(Color(hue: 0.066, saturation: 0.594, brightness: 0.948))
                .cornerRadius(10)
                .padding(5)
                
                
            }//End of forEach FOR CUISINETYPE
            
            
            
        }//End of MainVStack
        .padding()
        Spacer()
    }
}


struct RestaurantSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantSelectionView(restaurant: (Restaurant(name: "Carlos", cuisineType: .mexican, priceRange: .three, rating: 4.6, image: "")))
    }
}
