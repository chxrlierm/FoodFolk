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
    
    var textSelection: String {
        get {
            var section = ""
            
            for restaurantLists in filteredRestaurant {
                
                section = cusineTypeStatus(cusineType: CuisineType(rawValue: restaurantLists.cuisineType.rawValue) ?? CuisineType.american)
                
            }
            
            return section
            
        }
        
    }
    
    @Environment(\.presentationMode) private var presentationMode
    
    
    var body: some View {
        
        VStack {
            Text ("\(textSelection)")
                .padding(.bottom, 20)
                .font(.system(size: 22, weight: .bold, design: .rounded))
                .foregroundColor(Color(hue: 0.066, saturation: 0.594, brightness: 0.948))
            
            Text("What price range will you prefer?")
                .padding(.bottom, 20)
                .font(.system(size: 20, weight: .semibold, design: .serif))
                .foregroundColor(.black)
            
            
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
                        .font(.system(size: 22, weight: .heavy, design: .monospaced))
                }
                .frame(width: 150, height: 45)
                .foregroundColor(.white)
                .background(Color(hue: 0.066, saturation: 0.594, brightness: 0.948))
                .cornerRadius(10)
                .padding(5)
                
            }//End of forEach FOR CUISINETYPE
            
        }//EndOFVStack
        .padding()
        
        Spacer()
    }
}

struct FilterRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        FilterRestaurantView(restaurant: (Restaurant(name: "", cuisineType: .american, priceRange: .one, rating: 4.5, image: "")))
    }
}
