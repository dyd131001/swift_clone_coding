//
//  Home.swift
//  FruitMart_pjy
//
//  Created by 박정용 on 4/4/24.
//

import SwiftUI


struct Home: View {

    @EnvironmentObject private var store: Store
    
        
    var body: some View {
    
        NavigationView {
            VStack{
                Text("2019110485 박정용")
                List(store.products) { product in
                    NavigationLink(destination:  ProductDetailView(product: product)){
                        ProductRow(product: product)
                    }
                    //.buttonStyle(PlainButtonStyle()) // .onTapGesture
                }
                .navigationBarTitle("과일마트")
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Preview(source: Home())
        .environmentObject(Store())
    }
}
