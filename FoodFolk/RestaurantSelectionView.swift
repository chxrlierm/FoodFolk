//
//  RestaurantSelectionView.swift
//  FoodFolk
//
//  Created by admin on 5/13/22.
//

import SwiftUI

struct RestaurantSelectionView: View {
    var body: some View {
        VStack {
            Text("Let's find you the best option where to eat!")
            Text("Starving is not cool!")
                .padding(.bottom, 20)
            Text("Which type of food would you like to eat?")
                .padding(.bottom, 20)
            
        //Mex Btn
            Button {
                
            } label: {
                Text("Mexican")
            }//End of Mexican BTN
            
        //American Btn
            Button {
                
            } label: {
                Text("American")
            }//End of American BTN
            
        //Chinese Btn
            Button {
                
            } label: {
                Text("Chinese")
            }//End of Chinese BTN
            
        //Italian Btn
            Button {
                
            } label: {
                Text("Italian")
            }//End of Italian BTN

        }//End of MainVStack
    }
}

struct RestaurantSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantSelectionView()
    }
}
