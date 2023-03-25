//
//  NavigationBar.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 23.03.2023.
//

import SwiftUI

struct HomeNavigationBar: View {
    var body: some View {
        HStack {
            Image(systemName: "text.justify")
                .font(.system(size: 20,weight: .bold))
                .padding(.leading,5)
                Spacer()
            
            HStack(spacing:0){
                Text("Trade by ")
                    .font(.custom("Montserrat-Bold", size: 14))
                    
                Text("bata")
                    .font(.custom("Montserrat-Bold", size: 14))

                    .foregroundColor(.blue)
            }
            Spacer()
            VStack(){
                Image("person")
                    .resizable()
                   // .background(Circle())
                    .foregroundColor(.black)
                    .shadow(radius: 3)
                    .frame(width: 30,height: 30)
                    Text("Location ⌄")
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
            }
        }.padding(15)
            
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            HomeNavigationBar()
            Spacer()
        }
        
            
    }
}
