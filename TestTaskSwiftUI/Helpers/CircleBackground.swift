//
//  CircleBackground.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 24.03.2023.
//

import SwiftUI

struct CircleBackground: View {
    var body: some View {
        Circle()
            .frame(width: 40,height: 40)
            .foregroundColor(tabBarSelectedColor)
    }
}

struct CircleBackground_Previews: PreviewProvider {
    static var previews: some View {
        CircleBackground()
    }
}
