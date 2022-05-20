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
    @State var showHomeView: Bool = false
    @State var showFavorites: Bool = false
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
                NavigationLink(isActive: $showFavorites) {
                    
                    FavoritePlacesView(favorite: restaurantList)

                    
                } label: {
                    EmptyView()
                }
                Button(action: {
                    
                    showFavorites = true
                    if favoriteState {
                        addToFavorites()
                    }

                    
                }, label: {
                    Text("Save to Favorites")
                    
                    
                })
                
                Spacer()
                
//                if favoriteState {
//
//                    Image(systemName: "heart.fill")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 50)
//                        .foregroundColor(.red)
//
//
//                }else {
//                    Image(systemName: "heart")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 25)
//                        .foregroundColor(.white)
//
//                }

               
                
                NavigationLink(isActive: $showHomeView) {
                    
                    HomeView(name: "", restaurantInfo: Restaurant(name: "", cuisineType: .mexican, priceRange: .two, rating: 4.5, image: ""))

                    
                } label: {
                    EmptyView()
                }

                Button {
                    
                    showHomeView = true
                    
                } label: {
                    Text("HOME")
                }


            }.padding()
        
        }//End of VStack
        
        Spacer()
    }
}

struct RestaurantCard_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCard(restaurantList: Restaurant(name: "", cuisineType: .mexican, priceRange: .three, rating: 4.5, image: ""), favoriteState: .constant(false))
    }
}
