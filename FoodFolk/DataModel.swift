//
//  DataModel.swift
//  FoodFolk
//
//  Created by admin on 5/12/22.
//

import Foundation


enum CusineTypes: String {
    
    case american
    case mexican
    case asian
    case italian
    
}

enum Prices: String {
    
    case one = "$"
    case two = "$$"
    case three = "$$$"
    case four = "$$$$"
}

struct Restaurant: Identifiable {
    
    var id = UUID().uuidString
    var name: String
    var cuisineType: CusineTypes
    var priceRange: Prices
    var rating: Double
    

    func formattingRestaurant() -> String {
        return "The restaurant: \(name), with a price range of \(priceRange), they offer \(cuisineType) food and beverages, beating a global rating of: \(rating) (accodring to Google Maps)"
    }
    
}



