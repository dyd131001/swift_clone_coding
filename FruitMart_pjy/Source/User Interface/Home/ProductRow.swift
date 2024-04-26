//
//  ProductRow.swift
//  FruitMart_pjy
//
//  Created by 박정용 on 4/4/24.
//

import SwiftUI

struct ProductRow: View {
    let product: Product
    var body: some View {
        HStack {
            productImage
            productDescription
        }
        .frame(height: 150)
        .background(Color.primary.colorInvert())
        .cornerRadius(6)
        .shadow(color: Color.primaryShadow, radius: 1, x: 2, y: 2)
        .padding(.vertical, 8)
    }
}



private extension ProductRow{
    var productImage: some View {
        Image(product.imageName) // 상품 이미지
            .resizable()
            .scaledToFill()
            .frame(width: 140)
            .clipped()
    }

    var productDescription: some View {
        VStack(alignment: .leading){ // 정렬 기준 변경
            Text(product.name)
                .font(.headline)
                .fontWeight(.medium)
                .padding(.bottom, 6)
                //상품 설명 부분에 작성
            Text(product.description)
                .font(.footnote)
                .foregroundColor(Color.secondaryText)
            Spacer()
            footerView
            
        }
    }

    var footerView: some View {

        HStack(spacing: 0){ // HStack 내 자식 뷰 사이의 간격을 0으로 지정
            Text("￦").font(.footnote) + Text("\(product.price)").font(.headline) // 가격 정보
            Spacer()
            Image(systemName: "heart") // 하트 아이콘
                .imageScale(.large)
                .foregroundColor(Color.peach1)
                .frame(width: 32, height: 32)
            Image(systemName: "cart") // 카트 아이콘
                .foregroundColor(Color.peach1)
                .frame(width: 32, height: 32)
            }
            .padding([.leading,.bottom], 12)
            .padding([.top, .trailing])
    }

}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
            Group {
                ForEach(productSamples) {
                    ProductRow(product: $0)
                }
                ProductRow(product: productSamples[0])
                    .preferredColorScheme(.dark)
            }
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
