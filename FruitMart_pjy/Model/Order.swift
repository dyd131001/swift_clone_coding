//
//  Order.swift
//  FruitMart_pjy
//
//  Created by 박정용 on 5/9/24.
//

import Foundation

struct Order: Identifiable { // 식별을 위한 Identifiable 프로토콜 채택
    static var orderSequene = sequence(first: 1) { $0 + 1 }
    // 초기값은 1로 지정하여 다음 값은 이전 값에 1을 더한 값이 되도록 생성함
    let id: Int // 주문 번호
    let product: Product
    let quantity: Int
    var price: Int {
        product.price * quantity
    }
}
