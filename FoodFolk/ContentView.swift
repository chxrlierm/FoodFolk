//
//  ContentView.swift
//  FoodFolk
//
//  Created by admin on 5/7/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            List{
                
                NavigationLink {
                    RestaurantSelectionView()
                } label: {
                    Image(systemName: "questionmark.circle")
                    Text("Start your search here!")
                }
                
                NavigationLink {
                    FavoritePlacesView()
                } label: {
                    Image(systemName: "star.circle")
                    Text("Favorite Places")
                }

                NavigationLink {
                    RouletteView()
                } label: {
                    Image(systemName: "sun.max.circle")
                    Text("Random Roulette!")
                }
                
                
            }//End of List
        }// End of NavigationView
       
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

