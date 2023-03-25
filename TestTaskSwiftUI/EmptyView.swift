//
//  EmptyView.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 22.03.2023.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        Text("Hello")
            .font(.custom("Montserrat-Black", size: 20))
          //  .font(.system(size: 20))
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
