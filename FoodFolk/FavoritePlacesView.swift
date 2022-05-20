//
//  FavoritePlacesView.swift
//  FoodFolk
//
//  Created by admin on 5/12/22.
//

import SwiftUI


struct FavoritePlacesView: View {
    
    @State var favorite: Restaurant
    var body: some View {
        Text("Favorite: ")
        
        List{
            ForEach(favorites) { quote in
                
                    
                    VStack (alignment: .leading) {
                        
                        Text ("\(quote.name)")
                        Text ("Author: \(quote.rating)")
                        Text ("Category: \(quote.priceRange.rawValue)")
                    }
                
            }//end of ForEach
        }
    }
}

struct FavoritePlacesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritePlacesView(favorite: Restaurant(name: "", cuisineType: .mexican, priceRange: .one, rating: 4.5, image: ""))
    }
}
