//
//  FavoriteButton.swift
//  FruitMart_pjy
//
//  Created by 박정용 on 5/9/24.
//

import SwiftUI

struct FavoriteButton: View {
    @EnvironmentObject private var store: Store
    let product: Product
    
    private var imageName: String {
        product.isFavorite ? "heart.fill" : "heart" // 즐겨찾기 여부에 따라 심벌 변경
    }
    
    var body: some View {
        Symbol(imageName, scale: .large, color: .peach)
            .frame(width: 32, height: 32)
            .onTapGesture {
            self.store.toggleFavorite(of: self.product)
            }
        }
}

struct FavoriteButton_Previews: PreviewProvider {
static var previews: some View {
    Group {
        FavoriteButton(product: productSamples[0])
        FavoriteButton(product: productSamples[2])
    }
    .padding()
    .previewLayout(.sizeThatFits)
    }
}
