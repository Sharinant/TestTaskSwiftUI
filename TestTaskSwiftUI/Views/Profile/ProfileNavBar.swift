//
//  ProfileNavBar.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 24.03.2023.
//

import SwiftUI

struct ProfileNavBar: View {
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "arrow.backward")
                    .foregroundColor(.black)
                    .font(.system(size: 20,weight: .bold))
                    .padding(.leading,5)
            }

         
                Spacer()
            Text("Profile")
                .font(.custom("Montserrat-Bold", size: 14))
                .padding(.trailing,25)
            Spacer()
           
        }.padding(15)
            
    }
}

struct ProfileNavBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ProfileNavBar()
            Spacer()
        }
    }
}
