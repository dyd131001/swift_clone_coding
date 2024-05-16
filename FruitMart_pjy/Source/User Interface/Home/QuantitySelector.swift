//
//  QuantitySelector.swift
//  FruitMart_pjy
//
//  Created by 박정용 on 5/3/24.
//

import SwiftUI

struct QuantitySelector: View {
    
    @Binding var quantity: Int // (1)
    var range: ClosedRange<Int> = 1...20 // 수량 선택 가능 범위
    private let softFeedback = UIImpactFeedbackGenerator(style: .soft)
    private let rigidFeedback = UIImpactFeedbackGenerator(style: .rigid)
    var body: some View {
        HStack {
            Button(action: { self.changeQuantity(-1) }) { // 수량 감소 버튼
                Symbol("minus.circle.fill", scale: .large, color: Color.gray.opacity(0.5))
                    .padding()
            }
            .foregroundColor(Color.gray.opacity(0.5))
            Text("\(quantity)") // 현재 수량을 나타낼 텍스트
                .bold()
                .font(Font.system(.title, design: .monospaced)) // (2)
                .frame(minWidth: 40, maxWidth: 60)
            Button(action: { self.changeQuantity(1) }) { // 수량 증가 버튼
                Symbol("plus.circle.fill", scale: .large, color: Color.gray.opacity(0.5))
                    .padding()
            }
        }
    }
    private func changeQuantity( _ num: Int) {
        if range ~= quantity + num {
            quantity += num
            softFeedback.prepare() // 진동 지연 시간을 줄일 수 있도록 미리 준비시키는 메서드
            softFeedback.impactOccurred(intensity: 0.8) // (1)
        } else {
            rigidFeedback.prepare()
            rigidFeedback.impactOccurred() // (2)
        }
    }
}

struct QuantitySelector_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            QuantitySelector(quantity: Binding<Int>(get: {1}, set: {_ in}))
            QuantitySelector(quantity: Binding<Int>(get: {10}, set: {_ in}))
            QuantitySelector(quantity: Binding<Int>(get: {20}, set: {_ in}))
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
