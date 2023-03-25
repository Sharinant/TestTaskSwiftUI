//
//  CategoriesView.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 22.03.2023.
//

import SwiftUI

struct CategoriesView: View {
        
        var category : Category
        
        var body: some View {
            VStack(alignment: .center,spacing: 0) {
                Button {
                 //some action
                } label: {
                    category.image
                        .padding()
                }
                .background(Circle())
                .foregroundColor(categoryBackColor)
                .frame(width: 50,height: 50)
                
                Text(category.rawValue)
                    .font(.custom("Montserrat-ExtraLight", size: 12))
                    .padding(.top,-10)
                    .padding()
                    .scaledToFill()
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }.padding(.bottom)
        
    }

}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(category: .cars)
    }
}
