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
    @State var newArray: [Restaurant] = []
    
    @State var newArrayFiler: [Restaurant] = Restaurant.restaurantsList.filter {
        $0.cuisineType.rawValue == "Mexican"
    }
    
    @State var showAllRestaurantsView: Bool = false
    
    @State var selectPriceRangeIndex = ""

    
    var body: some View {
        
        VStack {
            Text("Let's find you the best option where to eat!")
            Text("Starving is not cool!")
                .padding(.bottom, 20)
            Text("Which type of food would you like to eat?")
                .padding(.bottom, 20)
            
            ForEach (CusineTypes.allCases, id: \.self){ restType in
                NavigationLink(isActive: $showAllRestaurantsView) {
                    
                    

//                    let filterItems = Restaurant.restaurantsList.filter{
//                        $0.cuisineType.rawValue == restType.rawValue
//                    }
//
//                    let newArrayRestaurant: [Restaurant] = filterItems
//                    
//                    
                    
                    FilterRestaurantView(restaurant: restaurant)
                   
                    
                    
 
//                    AllRestaurantsView(restaurants: Restaurant.restaurantsList.filter{ $0.cuisineType.rawValue == restType.rawValue}
                  
                           
                    //)

                    
                } label: {
                    
//                    Text("\(restType.rawValue)")
                    EmptyView()
                    
                }
                
                Button {
                    
                    
                    filterByCousineType(cuisineType: "\(restType.rawValue)")
                        
                    showAllRestaurantsView = true
                    
                } label: {
                    Text("\(restType.rawValue)")
                }

      
            }//End of forEach FOR CUISINETYPE
            

            Text("What price range will you prefer?")
                .padding(.bottom, 20)
            
//            Picker("Price", selection: $selectPriceRangeIndex, content:{
//
//                Text("$").tag(0)
//                Text("$$").tag(1)
//
//
//            })
            
            Text("Select Price: \(selectPriceRangeIndex)")
            
            Picker("Price Range", selection: $selectPriceRangeIndex) {
                
                ForEach (Prices.allCases, id: \.self) {
                    priceRange in
                    Text(priceRange.rawValue).tag(Prices.allCases.firstIndex(of: priceRange))
                }

                
            }.pickerStyle(SegmentedPickerStyle())
            
           Text("Index: \(selectPriceRangeIndex)")
            
            

 
//                    Picker("Price Range", selection: restaurant.priceRange) {
//
//                        ForEach (Prices.allCases, id: \.self) {
//                            priceRange in
//                            Text(priceRange.rawValue).tag(priceRange)
//                        }
//
//
//                    }.pickerStyle(SegmentedPickerStyle())
         
            NavigationLink {
                
                
              
                
                
                
                
                
            } label: {
                
                Text("Start")
                
            }
            
            
        }//End of MainVStack
    }
}


struct RestaurantSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantSelectionView(restaurant: (Restaurant(name: "Carlos", cuisineType: .mexican, priceRange: .three, rating: 4.6, image: "")))
    }
}
