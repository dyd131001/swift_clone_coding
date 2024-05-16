//
//  Home.swift
//  FruitMart_pjy
//
//  Created by 박정용 on 4/4/24.
//

import SwiftUI


struct Home: View {

    @EnvironmentObject private var store: Store
    @State private var quickOrder: Product?
    
        
    var body: some View {
    
        NavigationView {
            VStack{
                Text("2019110485 박정용")
                List(store.products) { product in
                    NavigationLink(destination:  ProductDetailView(product: product)){
                        ProductRow(product: product, quickOrder: self.$quickOrder)
                    }
                    //.buttonStyle(PlainButtonStyle()) // .onTapGesture
                }
                .navigationBarTitle("과일마트")
            }
        }
        .popupOverContext(item: $quickOrder, style: .blur, content: popupMessage(product:))
    }
    
    func popupMessage(product: Product) -> some View {
        let name = product.name.split(separator: " ").last! // (1) “수식어구+상품명” 에서
                    // “상품명”을 분리함. 예를 들어, ‘백설공주 사과’에서 ‘사과’만 가져옴
        return VStack {
            Text(name) // 상품명 표시
                .font(.title).bold().kerning(3)
                .foregroundColor(.peach)
                .padding()
            OrderCompletedMessage() // (2) 주문 완료 메시지는 기존에 만들었던 뷰를 재활용
        }
    }
    
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Preview(source: Home())
        .environmentObject(Store())
    }
}
