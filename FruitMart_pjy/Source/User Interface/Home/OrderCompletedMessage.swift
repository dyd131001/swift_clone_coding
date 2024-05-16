//
//  OrderCompletedMessage.swift
//  FruitMart_pjy
//
//  Created by 박정용 on 5/16/24.
//

import SwiftUI

struct OrderCompletedMessage: View {
    var body: some View {
        Text("주문 완료!")
            .font(.system(size: 24))
            .bold() // 볼드체
            .kerning(2) // 자간 조정
    }
}

struct OrderCompletedMessage_Previews: PreviewProvider {
    static var previews: some View {
        Color.primary.colorInvert()
            .popup(isPresented: .constant(true)) { OrderCompletedMessage() }
            .edgesIgnoringSafeArea(.vertical)
    }
}
