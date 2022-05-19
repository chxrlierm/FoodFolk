//
//  ContentView.swift
//  FoodFolk
//
//  Created by admin on 5/7/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var userInput: String
    @State var showHomeView = false
    
    
    var body: some View {
        NavigationView {
            
            VStack {
                Text("Welcome to FoodFolk!")
                Text("The app that tells you where you eat...")
                
                NavigationLink(isActive: $showHomeView) {
                    HomeView(name: userInput, restaurantInfo: Restaurant(name: "", cuisineType: .mexican, priceRange: .four, rating: 4.6, image: ""))
                } label: {
                    EmptyView()
                }
                
                Text("What's your name?")
                
                TextField("Enter your name here", text: $userInput)
                    .padding()
                
                Button(action: {
                    showHomeView = true
                    
                }, label: {
                    
                    Text ("Let's Start")
                    
                }).disabled(userInput.count < 2)
                
                
                
            }//End of VStack
            
            
            
        }// End of NavigationView
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(userInput: "")
    }
}

