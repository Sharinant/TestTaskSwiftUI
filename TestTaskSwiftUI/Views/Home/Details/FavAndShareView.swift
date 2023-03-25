//
//  FavAndShareView.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 25.03.2023.
//

import SwiftUI

struct FavAndShareView: View {
    var body: some View {
        VStack{
            Image(systemName: "heart")
           
            
            Text("-")
            Image(systemName: "square.and.arrow.up")
        }.padding()
        .background(Color.gray)
        .cornerRadius(20)
    }
}

struct FavAndShareView_Previews: PreviewProvider {
    static var previews: some View {
        FavAndShareView()
    }
}
