//
//  RestaurantSelectionView.swift
//  FoodFolk
//
//  Created by admin on 5/13/22.
//

import SwiftUI

struct RestaurantSelectionView: View {
    @Binding var restaurant: Restaurant
    
    
    var body: some View {
        VStack {
            Text("Let's find you the best option where to eat!")
            Text("Starving is not cool!")
                .padding(.bottom, 20)
            Text("Which type of food would you like to eat?")
                .padding(.bottom, 20)
            
            Picker("Restaurants", selection: $restaurant.cuisineType) {
                
                Text("Mexican").tag(CusineTypes.mexican)
                
                Text("American").tag(CusineTypes.american)
                
                Text("Italian").tag(CusineTypes.italian)
                
                Text("Chinese").tag(CusineTypes.chinese)
                
            }.pickerStyle(.wheel)
            
            Text("What price range will you prefer?")
                .padding(.bottom, 20)
            
            Picker("Price Range", selection: $restaurant.priceRange) {
                Text("$").tag(Prices.one)
                
                Text("$$").tag(Prices.two)
                
                Text("$$$").tag(Prices.three)
                Text("$$$$").tag(Prices.four)
                
            }.pickerStyle(SegmentedPickerStyle())
            
            NavigationLink {
                HomeView(name: "", clickSave: false, userInput: "", restaurantInfo: Restaurant(name: "", cuisineType: .mexican, priceRange: .one, rating: 4.6, image: ""))

            } label: {
                Text("Start")
                Button {
                    
                } label: {
                    Text("Start")
                }

            }


        }//End of MainVStack
    }
}

struct RestaurantSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantSelectionView(restaurant: .constant(Restaurant(name: "Carlos", cuisineType: .mexican, priceRange: .three, rating: 4.6, image: "")))
    }
}
