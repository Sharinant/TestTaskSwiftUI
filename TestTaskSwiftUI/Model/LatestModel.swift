//
//  LatestModel.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 23.03.2023.
//

import Foundation
import SwiftUI


struct LatestModel : Codable {
        var latest : [good]
    }

    struct good : Codable {
        var category : String
        var name : String
        var price : Double
        var imageUrl : String
        
        enum CodingKeys : String,CodingKey {
            case category = "category"
            case name = "name"
            case price
            case imageUrl = "image_url"
        }
    }

