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
                HomeView(name: userInput)
            } label: {
                EmptyView()
            }

            Text("What's your name?")
            
            TextField("Enter your name here", text: $userInput)
            
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
