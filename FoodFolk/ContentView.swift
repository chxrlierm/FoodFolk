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
                    QuizView()
                } label: {
                    Text("Start Quiz")
                }
                
                NavigationLink {
                    FavoritePlacesView()
                } label: {
                    Text("Favorite Places")
                }

                NavigationLink {
                    RouletteView()
                } label: {
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

