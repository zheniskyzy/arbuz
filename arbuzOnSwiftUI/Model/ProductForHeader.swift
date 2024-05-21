//
//  ProductForHeader.swift
//  arbuzOnSwiftUI
//
//  Created by Madina Olzhabek on 17.05.2024.
//

import Foundation

struct ProductForHeader: Identifiable{
    var id = UUID()
    var image = "https://img.freepik.com/free-photo/falling-watermelon-slices-isolated-white-background_123827-29643.jpg?t=st=1715926808~exp=1715930408~hmac=3ea08e65591f9f4c64dfb0a5243af6e70a38029b5b44e6d2b0bb43b16369572e&w=1480"
    var name: String = "Watermelon"
    var price: String = "1200"
    var minQuality: String = "1 кг"
    var description: String = "здесь какое-то описание продукта"
}
