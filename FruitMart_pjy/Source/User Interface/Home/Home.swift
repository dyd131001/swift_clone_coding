//
//  Home.swift
//  FruitMart_pjy
//
//  Created by 박정용 on 4/4/24.
//

import SwiftUI


struct Home: View {

    let store: Store
    
        
    var body: some View {
    
        NavigationView {
            VStack{
                List(store.products) { product in
                    NavigationLink(destination:  ProductDetailView(product: product)){
                        ProductRow(product: product)
                    }
                }
                .navigationBarTitle("과일마트")
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Preview(source: Home(store: Store()))
    }
}
