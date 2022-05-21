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
            
            ZStack{
                Rectangle()
                    .foregroundColor(Color(hue: 0.066, saturation: 0.594, brightness: 0.948))
                    .cornerRadius(50)
                    .padding()
                
                VStack{
                    Text("Nice! Looks like you are going to eat at:")
                        .font(.system(size: 22, weight: .bold, design: .monospaced))
                        .padding()
                    
                    
                    ForEach(restaurantCard) { restaurantList in
                        
                        Text ("\(restaurantList.name)")
                            .font(.system(size: 25, weight: .heavy, design: .monospaced))
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.center)
                        
                        Text ("Cuisine Type: \(restaurantList.cuisineType.rawValue)")
                            .font(.system(size: 18, weight: .heavy, design: .monospaced))
                            .fontWeight(.black)
                        
                        Text ("Price Range: \(restaurantList.priceRange.rawValue)")
                            .font(.system(size: 18, weight: .heavy, design: .monospaced))
                        
                        Text ("Rating: \(restaurantList.rating, specifier: "%.1f")")
                            .font(.system(size: 18, weight: .heavy, design: .monospaced))

                        Image("\(restaurantList.image)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                        
                        
                    }//Endof ForEach
                }.foregroundColor(.white)
                    
                
            }
            
            
            
            
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
