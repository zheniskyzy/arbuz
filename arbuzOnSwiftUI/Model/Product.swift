//
//  Product.swift
//  arbuzOnSwiftUI
//
//  Created by Madina Olzhabek on 16.05.2024.
//

import Foundation
import UIKit
import SwiftyJSON

struct Product: Identifiable {
    var id = UUID()
    var image: String = ""
    var name: String = ""
    var price: String = ""
    var minQuality: Int = 0
    var description: String = ""
    var addedCount = 0

    init(){
        
    }
    
    init(json: JSON){
        if let temp = json["image"].string{
            self.image = temp
        }
        if let temp = json["name"].string{
            self.name = temp
        } 
        if let temp = json["price"].string{
            self.price = temp
        }
        if let temp = json["minQuality"].int{
            self.minQuality = temp
        }
        if let temp = json["description"].string{
            self.description = temp
        }
        
    }
}
