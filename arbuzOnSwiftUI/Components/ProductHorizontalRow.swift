//
//  ProductHorizontalRow.swift
//  arbuzOnSwiftUI
//
//  Created by Madina Olzhabek on 17.05.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductHorizontalRow: View {
    var product: Product
    @State private var isFavorite = false
    @State private var isAdded = false
    @State private var counter = 0
    
    var body: some View {
        HStack {
            VStack {
                ZStack{
                    WebImage(url: URL(string: product.image))
                        .resizable()
                        .frame(width: 200, height: 150)
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
                    .position(x: 180, y: 20)

                }
                Text(product.name)
                    .font(.headline)
              
                    Text(product.description)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        .lineLimit(3)
                        .frame(width: 150, alignment: .leading)
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
                            }){
                                Image(systemName: "plus")
                                    .tint(.green)
                                    .bold()
                                    .frame(alignment: .leading)
                                    
                            }
                        }
                    }
            }

        }
    }
}

#Preview {
    ProductHorizontalRow(product: Product())
}
