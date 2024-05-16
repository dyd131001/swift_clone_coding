//
//  ProductDetailView.swift
//  FruitMart_pjy
//
//  Created by 박정용 on 4/18/24.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @EnvironmentObject private var store: Store
    @State private var showingAlert: Bool = false
    @State private var quantity: Int = 1
    
    var body: some View {
        VStack(spacing: 0) {
            productImage
            orderView
        }
        .ignoresSafeArea(edges:.top)
        .alert(isPresented: $showingAlert) { confirmAlert }
    }
}

private extension ProductDetailView{
    var productImage: some View {
        GeometryReader { _ in
        ResizedImage(self.product.imageName)
        }
    }

    
    var orderView: some View {
        GeometryReader{
            VStack(alignment: .leading){
                self.productDescription
                Spacer()
                self.priceInfo
                self.placeOrderButton
            }
            .frame(height: $0.size.height - 32)
            .padding(32)
            .background(Color.white) // 다크 모드에서도 흰색 배경을 사용하기 위해 white 지정
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: -5)
        }
    }
    var productDescription: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(product.name) // 상품명
                    .font(.largeTitle).fontWeight(.medium)
                    .foregroundColor(.black)
                Spacer()
                FavoriteButton(product: product)
            }
            Text(splitText(product.description)) // 상품 설명
                .foregroundColor(.secondaryText)
                .fixedSize() // 뷰의 크기가 작아져도 텍스트가 생략되지 않고 온전히 표현됨
            Text("2019110485 박정용")
                .font(.largeTitle).fontWeight(.medium)
                .foregroundColor(.black)
        }
    }
    func splitText(
    _
    text: String) -> String { // 한 문장으로 된 긴 상품 설명을 적절하게 두 줄로 나눔
        guard !text.isEmpty else { return text }
        let centerIdx = text.index(text.startIndex, offsetBy: text.count / 2)
        let centerSpaceIdx = text[..<centerIdx].lastIndex(of: " ") ?? text[centerIdx...].firstIndex(of: " ") ?? text.index(before: text.endIndex)
        let afterSpaceIdx = text.index(after: centerSpaceIdx)
        let lhsString = text[..<afterSpaceIdx].trimmingCharacters(in: .whitespaces)
        let rhsString = text[afterSpaceIdx...].trimmingCharacters(in: .whitespaces)
        return String(lhsString + "\n" + rhsString)
    }
    
    var priceInfo: some View {
        let price = quantity * product.price
        return HStack {
            (Text("￦") // 통화 기호는 작게 나타내고 가격만 더 크게 표시
             + Text("\(price)")
                .font(.title)
            ).fontWeight(.medium)
            Spacer()
            QuantitySelector(quantity: $quantity)
            // 수량 선택 버튼이 들어갈 위치 - 챕터 5에서 구현
        }
        // 배경을 다크 모드에서도 항상 흰색이 되게 지정해 텍스트도 항상 검은색이 되게 지정
        .foregroundColor(.black)
    }
    
    var placeOrderButton: some View { // 주문하기 버튼
        Button(action: {
            self.showingAlert = true
        }) {
            Capsule()
                .fill(Color.peach)
            // 너비는 주어진 공간을 최대로 사용하고 높이는 최소, 최대치 지정
                .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 55)
                .overlay(
                    Text("주문하기")
                        .font(.system(size: 20)).fontWeight(.medium)
                        .foregroundColor(Color.white)
                )
                .padding(.vertical, 8)
        }
        .buttonStyle(ShrinkButtonStyle())
    }
    
    var confirmAlert: Alert {
        Alert(title: Text("주문 확인"),
              message: Text("\(product.name)을(를) \(quantity)개 구매하겠습니까?"),
              primaryButton: .default(Text("확인"), action: {
                    self.placeOrder()
            }),
              secondaryButton: .cancel(Text("취소"))
        )
    }
    
    func placeOrder() {
    store.placeOrder(product: product, quantity: quantity)
    }
    
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let source1 = ProductDetailView(product: productSamples[0])
        let source2 = ProductDetailView(product: productSamples[1])
        return Group {
            Preview(source: source1)
            Preview(source: source2, devices: [.iPhone11Pro], displayDarkMode: false)
        }
    }
}
