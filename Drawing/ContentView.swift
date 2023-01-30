//
//  ContentView.swift
//  Drawing
//
//  Created by Putut Yusri Bahtiar on 29/01/23.
//

import SwiftUI

struct Triangle: InsettableShape {
    let startAngle: Angle
    let endAngle: Angle
    let clockWise: Bool
    var insetAmount = 0.0
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockWise)
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct ContentView: View {
    var body: some View {
            NavigationView {
                VStack {
                    Triangle(startAngle: .degrees(-180), endAngle: .degrees(180), clockWise: true)
                        .strokeBorder(.blue, lineWidth: 40)
                    
                    NavigationLink(destination: Flower()) {
                        Text("Flower")
                    }.padding(.bottom)
                    
                    NavigationLink(destination: BorderImage()) {
                        Text("Border Image")
                    }.padding(.bottom)
                    
                    NavigationLink(destination: drawingGroup()) {
                        Text("Drawing Group")
                    }
                    .padding(.bottom)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
