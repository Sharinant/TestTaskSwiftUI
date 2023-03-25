//
//  LatestCellView.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 22.03.2023.
//

import SwiftUI


struct ImageOverlay : View {
    
    @State var model : LatestViewModel

    var body: some View  {
        ZStack{
            
            HStack(alignment:.bottom){
                
                
                VStack(alignment: .leading,spacing: 2) {
                    Text(model.category.rawValue)
                        .font(.system(size: 9))
                        .padding(EdgeInsets(top: 1, leading: 4, bottom: 1, trailing: 4))
                    
                        .background(Color.gray)
                    //.opacity(0.7)
                        .cornerRadius(10)
                        .foregroundColor(.black)
                    
                    
                    Text(model.name)
                        .font(.custom("Montserrat-Medium", size: 10))
                        .lineLimit(2)
                    
                        .frame(height: 30)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                    Text("$" + model.price)
                        .font(.system(size: 9))
                        .foregroundColor(.white)
                        .lineLimit(1)
                    
                }
                Spacer()
                                    Button {
                    
                                    } label: {
                                        Image("plusButton")
                                            .resizable()
                                            .frame(width: 20,height: 25)
                                            .foregroundColor(.blue)
                                            .background(Circle())
                                            .foregroundColor(.white)
                    
                                    }
                                    
                
            }
           
            
            
            
        }
        
           
    }
}


struct LatestCellView: View {
    
    @State var model : LatestViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            
            
            
            AsyncImage(url: URL(string: model.image))  { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
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
            }.frame(width: 115,height: 150)
                .cornerRadius(15)
                .shadow(radius: 1)
                .overlay(alignment: .bottomLeading) {
                    ImageOverlay(model: model)
                        .padding(5)
                }
                
            //    Spacer()
          //  Divider()
            
        }
        .frame(width: 115,height: 150)
        
    
    }
}

struct LatestCellView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            LatestCellView(model: LatestViewModel(category: .cars, image: "https://mirbmw.ru/wp-content/uploads/2022/01/manhart-mhx6-700-01.jpg", price: "50000", name: "Sony Playstation 5"))
            LatestCellView(model: LatestViewModel(category: .cars, image: "https://www.dhresource.com/0x0/f2/albu/g8/M01/9D/19/rBVaV1079WeAEW-AAARn9m_Dmh0487.jpg", price: "50000", name: "Sony Playstation 5"))
           
        }
        
    }
}
