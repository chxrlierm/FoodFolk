//
//  ContentView.swift
//  FoodFolk
//
//  Created by admin on 5/7/22.
//

import SwiftUI

struct ContentView: View {
    @State var userInput: String = ""
    @State var clickSave = true
    
    var body: some View {
        NavigationView {
            
            VStack {
                Text("Welcome to FoodFolk!")
                Text("The app that tells you where you eat...")
                NavigationLink {
                    UserInfoView(clickSave: $clickSave, userInput: $userInput)
                } label: {

                    Text("Let's Start")
                }
                


                
              
            }//End of VStack
          
        }// End of NavigationView
       
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

