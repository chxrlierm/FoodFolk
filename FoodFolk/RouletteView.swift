//
//  RouletteView.swift
//  FoodFolk
//
//  Created by admin on 5/12/22.
//

import SwiftUI

enum Color: String {
    case purple = "American"
    case navyblue = "Chinese"
    case blue = "Mexican"
    case green = "Italian"
    case empty = "Please press SPIN"
}


struct Sector: Equatable {
    let number: Int
    let color: Color
}


struct RouletteView: View {
    @State private var isAnimating = false
    @State private var spinDegrees = 0.0
    @State private var rand = 0.0
    @State private var newAngle = 0.0
    
    let halfSector = 360.0 / 8.0 / 2.0
    
    let sectors: [Sector] = [
        Sector(number: 1, color: .purple),
        Sector(number: 2, color: .navyblue),
        Sector(number: 3, color: .blue),
        Sector(number: 4, color: .green),
        Sector(number: 5, color: .purple),
        Sector(number: 6, color: .navyblue),
        Sector(number: 7, color: .blue),
        Sector(number: 8, color: .green),
    ]
    
    var spinAnimation: Animation {
        Animation.easeOut(duration: 1.5)
            .repeatCount(1, autoreverses: false)
    }
    
    func getAngle(angle: Double) -> Double {
        let deg = 360 - angle.truncatingRemainder(dividingBy: 360)
        return deg
    }
    
    func sectorFromAngle(angle: Double) -> String {
        var i = 1
        var sector: Sector = Sector(number: 0, color: .empty)
        
        while sector == Sector(number: 0, color: .empty) && i < sectors.count {
            let start: Double = halfSector * Double((i*2)) - halfSector
            let end: Double = halfSector * Double((i*2 + 1))
            
            if(angle >= start && angle < end) {
                sector = sectors[i]
            }
            i+=1
        }
        return "Restaurant:\n\(sector.color.rawValue)"
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
            .background(.orange)
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
