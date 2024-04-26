//
//  Store.swift
//  FruitMart_pjy
//
//  Created by 박정용 on 4/12/24.
//

import Foundation

final class Store{
    var products: [Product]
    
    init(filename: String = "ProductData.json") {
      self.products = Bundle.main.decode(filename: filename, as: [Product].self)
    }
  }
