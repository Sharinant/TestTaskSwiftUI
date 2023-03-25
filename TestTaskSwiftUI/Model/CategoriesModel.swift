//
//  Model.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 22.03.2023.
//

import Foundation
import SwiftUI

enum Category : String, Identifiable {
    
    case phones = "Phones"
    case headphones = "Headphones"
    case games = "Games"
    case cars = "Cars"
    case furniture = "Furniture"
    case kids = "Kids"
    case other = "Other"
    
    var image : Image {
        switch self {
            
        case .phones:
            return Image("phones")
        case .headphones:
            return Image("headphones")
            
        case .games:
            return Image("games")
            
        case .cars:
            return Image("cars")
            
        case .furniture:
            return Image("furniture")
            
        case .kids:
            return Image("kids")
        case .other:
            return Image("phones")
            
        }
    }
    
    var id : Int {
        switch self {
            
        case .phones:
            return 0
        case .headphones:
            return    1
            
        case .games:
            return    2
            
        case .cars:
            return    3
            
        case .furniture:
            return   4
            
        case .kids:
            return    5
        case .other:
            return    6
            
            
        }
        
        
        
    }
}
