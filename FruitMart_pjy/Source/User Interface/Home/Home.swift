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
    @State private var showingFavoriteImage: Bool = true
    
        
    var body: some View {
    
        NavigationView {

            VStack {
                if showFavorite { // 즐겨찾기 상품이 없으면 무시
                    favoriteProducts // 구현해 둔 스크롤 뷰에 해당하는 프로퍼티
                }
                darkerDivider // (2)
                if #available(iOS 16.0, *) {
                    productList
                        .scrollContentBackground(.hidden)
                        .background(Color.background)
                } else {
                    productList
                }
            }
            .navigationBarTitle("과일마트")
            
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
    
    var favoriteProducts: some View { // 즐겨찾는 상품 목록
        FavoriteProductScrollView(showingImage: $showingFavoriteImage)
            .padding(.top, 24)
            .padding(.bottom, 8)
    }
    
    var darkerDivider: some View { // 커스텀 구분선
        Color.primary
            .opacity(0.3)
            .frame(maxWidth: .infinity, maxHeight: 1)
    }
    
    var productList: some View { // body에 있던 기존 코드 추출
        List(store.products) { product in
            if #available(iOS 15.0, *) {
                ZStack {
                    ProductRow(product: product, quickOrder: self.$quickOrder)
                    NavigationLink(destination: ProductDetailView(product: product)) {
                        EmptyView()
                    }.frame(width: 0).opacity(0)
                }
                .listRowSeparator(.hidden) // iOS 15 이상
                .listRowBackground(Color.background)
            }
            else {
                ZStack {  
                    ProductRow(product: product, quickOrder: self.$quickOrder)
                    NavigationLink(destination: ProductDetailView(product: product)) {
                        EmptyView()
                    }.frame(width: 0).opacity(0)
                }
                    .listRowBackground(Color.background)
            }
        }
    }
    
    
    var showFavorite: Bool { // 즐겨찾는 상품 유무 확인
        !store.products.filter({ $0.isFavorite }).isEmpty
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Preview(source: Home())
        .environmentObject(Store())
    }
}
