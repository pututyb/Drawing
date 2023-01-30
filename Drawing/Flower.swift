//
//  Flower.swift
//  Drawing
//
//  Created by Putut Yusri Bahtiar on 30/01/23.
//

import SwiftUI

struct Bunga: Shape {
    //to move this petal away from center
    var petalOffset: Double = -20
    
    //how wide to make each petal
    var petalWidth: Double = 100
    
    func path(in rect: CGRect) -> Path {
        //for hold all petals
        var path = Path()
        
        //count from 0 up to pi * 2, move up pi / 8 each time
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 10) {
            //rotate petal by current value of our loop
            let rotation = CGAffineTransform(rotationAngle: number)
            
            //move petal to be at the center our view
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            //create a path for petal using our properties plus a fidxed Y and height
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
            
            //apply our rotation/position transformation to the petal
            let rotatedPetal = originalPetal.applying(position)
            
            //add it to our main path
            path.addPath(rotatedPetal)
        }
        
        return path
    }
}

struct Flower: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    var body: some View {
        VStack(alignment: .leading) {
            Bunga(petalOffset: petalOffset, petalWidth: petalWidth)
                .fill(.teal, style: FillStyle(eoFill: true))
            
            Text("Offset")
                .padding(.leading)
            Slider(value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])
                .tint(Color.red)
            
            Text("Width")
                .padding(.leading)
            Slider(value: $petalWidth, in: 0...100)
                .padding([.horizontal, .bottom])
                .tint(Color.green)
        }
    }
}

struct Flower_Previews: PreviewProvider {
    static var previews: some View {
        Flower()
    }
}
