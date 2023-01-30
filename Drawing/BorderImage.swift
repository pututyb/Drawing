//
//  BorderImage.swift
//  Drawing
//
//  Created by Putut Yusri Bahtiar on 30/01/23.
//

import SwiftUI

struct BorderImage: View {
    var body: some View {
        Capsule()
            .strokeBorder(ImagePaint(image: Image("bg"), scale: 0.1), lineWidth: 20)
            .frame(width: 200, height: 100)
    }
}

struct BorderImage_Previews: PreviewProvider {
    static var previews: some View {
        BorderImage()
    }
}
