//
//  HeaderOfProductCard.swift
//  arbuzOnSwiftUI
//
//  Created by Madina Olzhabek on 16.05.2024.
//

import SwiftUI
import SDWebImageSwiftUI
//import SwiftyJSON

struct HeaderOfProductCard: View {
//    var product: Product
    var productForHeader: ProductForHeader
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: productForHeader.image))
                .resizable()
                .frame(width: 320, height: 200 )
                .cornerRadius(12)
            Text(productForHeader.name)
                .font(.title)
            Text(productForHeader.description)
                .font(.subheadline)
                .foregroundStyle(.gray)
                Text("\(productForHeader.price) тг")
                    .bold()
                .tint(.green)
                .bold()
            
        }
    }
}

#Preview {
    HeaderOfProductCard(productForHeader: ProductForHeader())
    
}
