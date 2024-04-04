//
//  Item.swift
//  FruitMart_pjy
//
//  Created by 박정용 on 4/4/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
