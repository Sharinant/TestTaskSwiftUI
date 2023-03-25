//
//  FlashSaleView.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 23.03.2023.
//

import SwiftUI

struct ImageOverlayFlash : View {
    
    @State var model : FlashSaleViewModel
    
    @EnvironmentObject var coordinator : AppCoordinator

    var body: some View  {
        ZStack{
            
            
            
            
            VStack(alignment: .leading,spacing: 2) {
                HStack(alignment: .center,spacing: 80){
                    Image("personsale")
                        .foregroundColor(.white)
                    // Spacer()
                    
                    Text(model.discount + "% off")
                        .foregroundColor(.white)
                        .padding(3)
                        .background(Color.red)
                        .font(.system(size: 12))
                        .cornerRadius(10)
                }
                Spacer()
                
                
                
                Text(model.category.rawValue)
                    .font(.system(size: 9))
                    .padding(EdgeInsets(top: 1, leading: 4, bottom: 1, trailing: 4))
                
                    .background(Color.gray)
                //.opacity(0.7)
                    .cornerRadius(10)
                    .foregroundColor(.black)
                
                
                Text(model.name)
                    .font(.system(size: 10))
                    .lineLimit(2)
                
                    .frame(height: 30)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.white)
                
                
                HStack {
                    Text("$" + model.price)
                        .font(.system(size: 9))
                        .foregroundColor(.white)
                        .lineLimit(1)
                    
                    Spacer()
                  
                    Button {
                        
                    } label: {
                        Image("favButton")
                            .resizable()
                            .frame(width: 20,height: 20)
                            .foregroundColor(.blue)
                            .background(Circle())
                            .foregroundColor(.white)
                        
                    }
                    Button {
                        
                    } label: {
                        Image("plusButton")
                            .resizable()
                            .frame(width: 30,height: 30)
                            .foregroundColor(.blue)
                            .background(Circle())
                            .foregroundColor(.white)
                        
                        
                    }
                }
            }
        }.onTapGesture {
            coordinator.push(page: .firstDetails)
        }
    }
}


struct FlashSaleView: View {
    
    @State var model : FlashSaleViewModel

    
    var body: some View {
        VStack(alignment: .leading){
            
            AsyncImage(url: URL(string: model.image))  { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        
                        .resizable()
                        .scaledToFill()
                        
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    // Since the AsyncImagePhase enum isn't frozen,
                    // we need to add this currently unused fallback
                    // to handle any new cases that might be added
                    // in the future:
                    EmptyView()
                    
                }
            
                
                
            
        }.frame(width: 175,height: 220)
                .cornerRadius(15)
                .shadow(radius: 1)
                .overlay(alignment: .bottomLeading) {
                    ImageOverlayFlash(model: model)
                        .padding(7)
                }
        }
        .frame(width: 175,height: 220)
        
    }
}

struct FlashSaleView_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 10){
            FlashSaleView(model: FlashSaleViewModel(category: .cars, image: "https://newbalance.ru/upload/iblock/697/iz997hht_nb_02_i.jpg", price: "200", name: "Playstation 5", discount: "30"))
            FlashSaleView(model: FlashSaleViewModel(category: .cars, image: "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/3613ebaf6ed24a609818ac63000250a3_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_01_standard.jpg", price: "200", name: "Playstation 5", discount: "30"))
        }
        
    }
}
