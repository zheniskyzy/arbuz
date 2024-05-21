//
//  BasketPage.swift
//  arbuzOnSwiftUI
//
//  Created by Madina Olzhabek on 16.05.2024.
//

import SwiftUI
import SDWebImageSwiftUI


struct ProductForBasket: Identifiable {
    var id = UUID()
    var image = ""
    var name: String = ""
    var price: String = ""
    var addedCount = 0
}



struct BasketPage: View {

//    @ObservedObject  var basket = AppData()
    var productB: [ProductForBasket] = [
        ProductForBasket(image: "https://img.freepik.com/free-photo/falling-watermelon-slices-isolated-white-background_123827-29643.jpg?t=st=1715926808~exp=1715930408~hmac=3ea08e65591f9f4c64dfb0a5243af6e70a38029b5b44e6d2b0bb43b16369572e&w=1480", name: "Watermelon", price: "1200 тг", addedCount: 7),
        ProductForBasket(image: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Grapefruits_-_whole-halved-segments.jpg/550px-Grapefruits_-_whole-halved-segments.jpg", name: "GrapeFruit", price: "1000 тг", addedCount: 5),
        ProductForBasket(image: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Oranges_-_whole-halved-segment.jpg/600px-Oranges_-_whole-halved-segment.jpg", name: "Orange", price: "700 тг", addedCount: 7)]
    
    @State var isLinkActive = false
    
    var body: some View {

        NavigationView {
                   VStack {
                       ProductCollectionView(basket: productB)
                       
                           Button {
                               self.isLinkActive = true
                               print("tapped")
                           } label: {
                               Text("Checkout")
                                   .foregroundStyle(.white)
                                   .bold()
                           }
                           .frame(width: 300, height: 56)
                           .background(Color.green)
                           .cornerRadius(24)
                          
                       NavigationLink("", destination:  HelloWorldView(), isActive: $isLinkActive)
                           
                   }
               }
            
    }
}

#Preview {
    BasketPage()
}


struct ProductCollectionView: View {
//    @ObservedObject  var basket = AppData()
    var basket: [ProductForBasket]

    var body: some View {
        List {
            ForEach(basket) { item in
                BasketRow(product: item)
            }
        }
    }
}



struct BasketRow: View {
//    var product: Product
    var product: ProductForBasket
    
    var body: some View {
        VStack {
           HStack {
               WebImage(url: URL(string: product.image))
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(12)
                    .scaleEffect()
                
                VStack{
                    Text(product.name)
                        .font(.headline)
                    Text(product.price)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        .bold()
                }
            }
           
        }
    }
}
