//
//  FavoritePlacesView.swift
//  FoodFolk
//
//  Created by admin on 5/12/22.
//

import SwiftUI


struct FavoritePlacesView: View {
    @State var showHomeView: Bool = false
    
    @State var favorite: Restaurant
    var body: some View {
        VStack {
            Text("Favorite Restaurants")
                .font(.system(size: 22, weight: .heavy, design: .monospaced))
            
            List{
                ForEach(favorites) { restaurantLists in
                    
                        
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
                        
                    }
                    
                }//end of ForEach
                .font(.system(size: 16, weight: .bold, design: .monospaced))
                .foregroundColor(.white)
                .listRowBackground(Rectangle().foregroundColor(Color(hue: 0.066, saturation: 0.594, brightness: 1.0)))
            }
            
            NavigationLink(isActive: $showHomeView) {
                
                HomeView(name: "", restaurantInfo: Restaurant(name: "", cuisineType: .mexican, priceRange: .two, rating: 4.5, image: ""))
                
                
            } label: {
                EmptyView()
            }
            
        }.navigationBarItems(trailing: Button(action: {
            
            
            showHomeView = true
            //presentationMode.wrappedValue.dismiss()
            
        }, label: {
            Text("home".uppercased())
                .padding(10)
        }))
        
 
    }
}

struct FavoritePlacesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritePlacesView(favorite: Restaurant(name: "", cuisineType: .mexican, priceRange: .one, rating: 4.5, image: ""))
    }
}
