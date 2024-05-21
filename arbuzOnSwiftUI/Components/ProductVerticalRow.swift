//
//  ProductVerticalRow.swift
//  arbuzOnSwiftUI
//
//  Created by Madina Olzhabek on 17.05.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductVerticalRow: View {
    var product: Product
    @State private var isFavorite = false
    @State private var isAdded = false
    @State private var counter = 0

    @StateObject  var basket = AppData()
  
    
    var body: some View {
        
        VStack {
            ZStack{
                WebImage(url: URL(string: product.image))
                    .resizable()
                    .frame(width: 150, height: 100)
                    .cornerRadius(12)

                Button(action: {
                    isFavorite.toggle()
                    print("favorite added")
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(.green)
                        .frame(width: 20, height: 20)
                        .padding()
                }
                .position(x: 155, y: 20)

            }

            Text(product.name)
                .font(.headline)
          
                Text(product.description)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Text("минимум \(product.minQuality)")
                    .foregroundStyle(.green)
                    .font(.caption)
          
 
                if !isAdded {
                    HStack {
                        Text(product.price)
                            .bold()
                            .padding(.horizontal)
                            .padding(5)
                        
                        Button(action: {
                            isAdded.toggle()
                        }){
                            Image(systemName: "plus")
                                .tint(.green)
                                .bold()
                                .frame(alignment: .trailing)
                                .padding(.trailing, 5)
                        }
                    }
                    .background(Color.lightGrayyy)
                    .cornerRadius(12)
                }else{
                    HStack {
                        Button(action: {
                            print("minus")
//                            basketArray.selectedProduct.removeLast()
                           
                            if counter + product.minQuality <= product.minQuality {
                                isAdded = false
                            }else{
                                counter -= 1
                            }
                        }){
                            Image(systemName: "minus")
                                .tint(.green)
                                .bold()
                                .frame(alignment: .leading)
                        } 
                        
                        Text("\(counter + product.minQuality)")
                        
                        Button(action: {
                            print("plus")
                           counter += 1

                            basket.countOfProductAdded = counter + product.minQuality
                            basket.arrayOfProducts.append(product)
                            print("count of array \(basket.arrayOfProducts.count)")
                            print("addedCount ==== \(basket.countOfProductAdded)")
                           
                        }){
                            Image(systemName: "plus")
                                .tint(.green)
                                .bold()
                                .frame(alignment: .leading)
                                
                        }
                    }
                }
        }
//        .environmentObject(basket)
    }
    
}

#Preview {
    ProductVerticalRow(product: Product())
}

class AppData: ObservableObject {
    @Published var countOfProductAdded = 0
    @Published var arrayOfProducts: [Product] = []
    
//    func addProduct(productAdded: Product, count: Int) {
////        selectedProduct.append(productAdded)
//        selectedProduct = productAdded
//        countOfProductAdded = count
//    }
    
    
}
