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
            
          

            if restaurant.cuisineType.rawValue == "Mexican" {
                return cusineTypeStatus(cusineType: .mexican)
            }else if (restaurant.cuisineType.rawValue == "American") {
                return cusineTypeStatus(cusineType: .american)
            }
            
            return "MAKE A DIFFERENT SELECTION"
            
        }
    }
    
//    var tipAmount: Double {
//
//        get {
//            let billInput = Double(billAmountInput) ?? 0
//
//            return billInput * tipPercentage/100
//        }
//
//    }
    
    @Environment(\.presentationMode) private var presentationMode
    
    
    var body: some View {
        
        VStack {
            Text ("\(textSelection)")
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
                        .font(.system(size: 25, weight: .heavy, design: .monospaced))
                }
                .frame(width: 150, height: 45)
                .foregroundColor(.white)
                .background(.orange)
                .cornerRadius(10)
                .padding(5)
  
            }//End of forEach FOR CUISINETYPE
            
        }//EndOFVStack
        
        Spacer()
    }
}

struct FilterRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        FilterRestaurantView(restaurant: (Restaurant(name: "", cuisineType: .american, priceRange: .one, rating: 4.5, image: "")))
    }
}
