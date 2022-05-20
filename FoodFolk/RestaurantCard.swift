//
//  RestaurantCard.swift
//  FoodFolk
//
//  Created by admin on 5/19/22.
//

import SwiftUI

struct RestaurantCard: View {
    var restaurantList: Restaurant
    @Binding var favoriteState: Bool
    @Environment(\.presentationMode) private var presentationMode
    
    
    var body: some View {
        
        VStack {
            Text("Nice! Looks like you are going to eat at:")
            

                ForEach(restaurantCard) { restaurantList in
 
                        Text ("\(restaurantList.name)")
                        Text ("Cuisine Type: \(restaurantList.cuisineType.rawValue)")
                        Text ("Price Range: \(restaurantList.priceRange.rawValue)")
                        Text ("Rating: \(restaurantList.rating, specifier: "%.1f")")
                        
                        Image("\(restaurantList.image)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
       
                    
                }//Endof ForEach
            
            
            
            HStack{
                Button(action: {
                    favoriteState.toggle()
                    
                    if favoriteState {
                        addToFavorites()
                    }

                    
                }, label: {
                    Text("Save to Favorites")
                    Image(systemName: "plus")
                    
                })
                
                if favoriteState {
                    
                    Image(systemName: "heart.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                        .foregroundColor(.red)
                        
                    
                }else {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                        .foregroundColor(.white)
                        
                }

                Spacer()
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Try Again")
                }


            }.padding()
        
        }//End of VStack
    }
}

struct RestaurantCard_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCard(restaurantList: Restaurant(name: "", cuisineType: .mexican, priceRange: .three, rating: 4.5, image: ""), favoriteState: .constant(false))
    }
}
