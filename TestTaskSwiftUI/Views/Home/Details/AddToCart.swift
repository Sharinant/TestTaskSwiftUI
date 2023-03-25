//
//  AddToCart.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 25.03.2023.
//

import SwiftUI

struct AddToCart: View {
    var body: some View {
        HStack{
            VStack(alignment:.leading){
                Text("Quantity: ")
                    .font(.custom("Montserrat-ExtraLight", size: 12))
                    .foregroundColor(.gray)
                HStack{
                    Button {
                        
                    } label: {
                        Text("-")
                            .foregroundColor(.white)
                    }.padding()
                    .frame(width: 40,height: 22)
                    .background(signInButtonColor)
                    .cornerRadius(10)
                    
                    Button {
                        
                    } label: {
                        Text("+")
                            .foregroundColor(.white)
                    }.padding()
                        .frame(width: 40,height: 22)
                        .background(signInButtonColor)
                        .cornerRadius(10)

                }
            }
            Spacer()
            Button {
                
            } label: {
                HStack{
                    Text("#2,500")
                        .font(.custom("Montserrat-ExtraLight", size: 12))
                        .foregroundColor(.gray)
                    Text("ADD TO CART")
                        .font(.custom("Montserrat-Medium", size: 12))
                        .foregroundColor(.white)
                        

                }.padding()
                .frame(width: 170,height: 45)
                .background(signInButtonColor)
                .cornerRadius(10)
            }

        }.padding()
            .background(addToCartBackground)
            .cornerRadius(20)
    }
}

struct AddToCart_Previews: PreviewProvider {
    static var previews: some View {
        AddToCart()
    }
}
