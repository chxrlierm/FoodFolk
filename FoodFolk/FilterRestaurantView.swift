//
//  FilterRestaurantView.swift
//  FoodFolk
//
//  Created by admin on 5/16/22.
//

import SwiftUI

struct FilterRestaurantView: View {
    var body: some View {
        VStack {
            Text("Nice! Looks like you are going to eat at:")
            Text("Restaurant Name:  ()")
            Text("Type of food: ()")
            Text("Price: ()")
            Text("Rating: ()")
            Image(systemName: "star.circle")
            
            Spacer()
            
            
        }
    }
}

struct FilterRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        FilterRestaurantView()
    }
}
