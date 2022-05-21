//
//  RouletteView.swift
//  FoodFolk
//
//  Created by admin on 5/12/22.
//

import SwiftUI

enum Cuisine: String {
    case american = "American"
    case chinese = "Chinese"
    case mexican = "Mexican"
    case italian = "Italian"
    case empty = "Please press SPIN"
}


struct Sector: Equatable {
    let number: Int
    let cuisineType: Cuisine
}


struct RouletteView: View {
    @State private var isAnimating = false
    @State private var spinDegrees = 0.0
    @State private var rand = 0.0
    @State private var newAngle = 0.0
    
    let halfSector = 360.0 / 8.0 / 2.0
    
    let sectors: [Sector] = [
        Sector(number: 1, cuisineType: .american),
        Sector(number: 2, cuisineType: .chinese),
        Sector(number: 3, cuisineType: .mexican),
        Sector(number: 4, cuisineType: .italian),
        Sector(number: 5, cuisineType: .american),
        Sector(number: 6, cuisineType: .chinese),
        Sector(number: 7, cuisineType: .mexican),
        Sector(number: 8, cuisineType: .italian),
    ]
    
    var spinAnimation: Animation {
        Animation.easeOut(duration: 2.5)
            .repeatCount(1, autoreverses: false)
    }
    
    func getAngle(angle: Double) -> Double {
        let deg = 360 - angle.truncatingRemainder(dividingBy: 360)
        return deg
    }
    
    func sectorFromAngle(angle: Double) -> String {
        var i = 1
        var sector: Sector = Sector(number: 0, cuisineType: .empty)
        
        while sector == Sector(number: 0, cuisineType: .empty) && i < sectors.count {
            let start: Double = halfSector * Double((i*2)) - halfSector
            let end: Double = halfSector * Double((i*2 + 1))
            
            if(angle >= start && angle < end) {
                sector = sectors[i]
            }
            i+=1
        }
        return "Restaurant:\n\(sector.cuisineType.rawValue)"
    }
    
    
    var body: some View {
        VStack {
            Text(self.isAnimating ? "Spining\n..." : sectorFromAngle(angle : newAngle))
                .multilineTextAlignment(.center)
                .font(.system(size: 25, weight: .bold, design: .monospaced))
                .foregroundColor(.orange)
            Image("Arrow")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Image("Roulette2")
                .resizable()
                .scaledToFit()
                .rotationEffect(Angle(degrees: spinDegrees))
                .frame(width: 300, height: 300, alignment: .center)
                .animation(spinAnimation)
            Button("SPIN") {
                isAnimating = true
                rand = Double.random(in: 1...360)
                spinDegrees += 720.0 + rand
                newAngle = getAngle(angle: spinDegrees)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.9) {
                    isAnimating = false
                }
            }
            .padding(40)
            .disabled(isAnimating == true)
            .frame(width: 150, height: 45)
            .foregroundColor(.white)
            .background(Color(hue: 0.066, saturation: 0.594, brightness: 0.948))
            .cornerRadius(10)
            .font(.system(size: 26, weight: .heavy, design: .monospaced))
            
        }
    }
}

struct RouletteView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RouletteView()
        }
    }
}
