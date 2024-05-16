//
//  ResizedImage.swift
//  FruitMart_pjy
//
//  Created by 박정용 on 5/16/24.
//

import SwiftUI

struct ResizedImage: View {
    let imageName: String
    let contentMode: ContentMode
    let renderingMode: Image.TemplateRenderingMode?
    init(_ imageName: String,
         contentMode: ContentMode = .fill,
         renderingMode: Image.TemplateRenderingMode? = nil) {
        self.imageName = imageName
        self.contentMode = contentMode
        self.renderingMode = renderingMode
    }
    var body: some View {
        Image(imageName)
            .renderingMode(renderingMode)
            .resizable()
            .aspectRatio(contentMode: contentMode)
    }
}

#Preview {
    // 주의: Assets에 ‘SwiftUI’ 이미지가 등록된 경우임
    ResizedImage("SwiftUI", contentMode: .fit, renderingMode: .original)
}
