//
//  DetailsModel.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 25.03.2023.
//

import Foundation

struct detailsModel : Codable {
    var name : String
    var description : String
    var rating : Double
    var number_of_reviews : Int
    var price : Int
    var colors : [String]
    var image_urls : [String]
    
    enum CodingKeys : String,CodingKey {
        case name = "name"
        case description = "description"
        case rating
        case number_of_reviews
        case price
        case colors
        case image_urls 
    }

}
