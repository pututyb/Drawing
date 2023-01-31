//
//  Arrow.swift
//  Drawing
//
//  Created by Putut Yusri Bahtiar on 31/01/23.
//

import SwiftUI

struct Panah: Shape {
    var headHeight = 0.5
    var bodyWidth = 0.25
    
    var animatableData: AnimatablePair<Double, Double> {
        get {AnimatablePair(headHeight, bodyWidth)}
        set {
            headHeight = newValue.first
            bodyWidth = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        let height = rect.height * headHeight
        let thickness = rect.width * bodyWidth / 2
        
        return Path { path in
            path.move(to: CGPoint(x: rect.midX, y: 0))
            path.addLine(to: CGPoint(x: rect.maxX, y: height))
            path.addLine(to: CGPoint(x: rect.midX + thickness, y: height))
            path.addLine(to: CGPoint(x: rect.midX + thickness, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX - thickness, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX - thickness, y: height))
            path.addLine(to: CGPoint(x: 0, y: height))
            path.closeSubpath()
        }
    }
}

struct Arrow: View {
    @State private var headHight = 0.5
    @State private var bodyWidth = 0.25
    
    var body: some View {
        Panah(headHeight: headHight, bodyWidth: bodyWidth)
            .fill(.blue)
            .onTapGesture {
                withAnimation {
                    headHight = Double.random(in: 0.2...0.8)
                    bodyWidth = Double.random(in: 0.2...0.8)
            }
        }
    }
}

struct Arrow_Previews: PreviewProvider {
    static var previews: some View {
        Arrow()
    }
}
