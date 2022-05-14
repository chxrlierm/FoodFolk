//
//  UserInfoView.swift
//  FoodFolk
//
//  Created by admin on 5/14/22.
//

import SwiftUI

struct UserInfoView: View {
    @Binding var clickSave: Bool
    
    @Binding var userInput: String
    @State var showHomeView = false
    
    var body: some View {
        
        
        VStack {
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
                
                Text ("Save")
                
            }).disabled(userInput.count < 2)
                   
        }//End of VStack
        
        
        
        
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView(clickSave: .constant(true), userInput: .constant(""))
    }
}
