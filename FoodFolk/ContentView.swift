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
                    .font(.largeTitle)
                    .foregroundColor(.orange)
                    .padding(.bottom)
                
                Text("The app that tells you where to eat...")
                    .font(.headline)
                    .padding(.bottom)
                
                NavigationLink(isActive: $showHomeView) {
                    HomeView(name: userInput, restaurantInfo: Restaurant(name: "", cuisineType: .mexican, priceRange: .four, rating: 4.6, image: ""))
                } label: {
                    EmptyView()
                }
                
                VStack(alignment: .leading){
                    Text("What's your name?")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    TextField("Enter your name here", text: $userInput)
                        .frame(width: 300, height: 20, alignment: .leading)
                        .padding()
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 1)
                        }
                           
                    
                }.padding()
                
                Button(action: {
                    showHomeView = true
                    
                }, label: {
                    Text ("Let's Start")
                        .font(.system(size: 20, weight: .heavy, design: .monospaced))
                        .foregroundColor(.white)
 
                })//.disabled(userInput.count < 2)
                    .frame(width: 150, height: 40)
                    .foregroundColor(.white)
                    .background(.orange)
                    .cornerRadius(10)
                    
                    
                    
                
                Spacer()
                
            }//End of VStack
            
            
            
        }// End of NavigationView
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(userInput: "")
    }
}

