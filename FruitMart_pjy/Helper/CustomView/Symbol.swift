//
//  Symbol.swift
//  FruitMart_pjy
//
//  Created by 박정용 on 5/16/24.
//

import SwiftUI

struct Symbol: View {
    let systemName: String
    let imageScale: Image.Scale
    let color: Color?
    init(_ systemName: String,
         scale imageScale: Image.Scale = .medium,
         color: Color? = nil) {
        self.systemName = systemName
        self.imageScale = imageScale
        self.color = color
    }
    var body: some View {
        Image(systemName: systemName)
            .imageScale(imageScale)
            .foregroundColor(color)
    }
}


#Preview {
    Symbol("heart.fill", scale: .large, color: .red)
}
