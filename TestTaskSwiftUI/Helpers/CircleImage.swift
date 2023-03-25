//
//  CircleImage.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 20.03.2023.
//

import Foundation
import SwiftUI

struct CircleImage: View {
    
    var image : Image
    
    var body: some View {
        
        image
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay {
                Circle().stroke(.white, lineWidth: 1)
            }
            .shadow(radius: 7)
        
            
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("person"))
    }
}
