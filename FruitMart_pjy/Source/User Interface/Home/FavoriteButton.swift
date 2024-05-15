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
    
    var body: some View {
        Image(systemName: product.isFavorite ? "heart.fill" : "heart")
            .imageScale(.large)
            .foregroundColor(.peach)
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
