//
//  FlashSaleModel.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 23.03.2023.
//

import Foundation
import SwiftUI


struct FlashSaleModel : Codable {
        var flash_sale : [product]
    }

    struct product : Codable {
        var category : String
        var name : String
        var price : Double
        var imageUrl : String
        var discount : Int
        
        enum CodingKeys : String,CodingKey {
            case category = "category"
            case name = "name"
            case price
            case imageUrl = "image_url"
            case discount
        }
    }


