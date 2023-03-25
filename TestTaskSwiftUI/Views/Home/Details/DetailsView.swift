//
//  DetailsView.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 22.03.2023.
//

import SwiftUI

struct DetailsView: View {
    
    @EnvironmentObject var coordinator : AppCoordinator
    
    @ObservedObject private var model = DetailsViewModel()
    
    @State var selected : Int = 0
        
    var body: some View {
        VStack {
            HStack {
                Button {
                    coordinator.pop()
                } label: {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.black)
                }

                Spacer()
            }.padding()
            ZStack(alignment: .trailing) {
                ScrollViewReader { sp in
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ForEach(model.detViewModel?.images ?? [""],id: \.self) { item in
                                AsyncImage(url: URL(string: item))  { phase in
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
                                }
                                    .frame(width: screenSize.width,height: screenSize.width/1.5)

                                    .cornerRadius(20)
                                    
                            }
                        }
                    }.onReceive(model.$move) { ind in
                        sp.scrollTo(model.detViewModel?.images[ind])
                    }
                    .frame(width: screenSize.width,height: screenSize.width/1.5)
                }.padding()
                    .frame(width: screenSize.width,height: screenSize.width/1.5)
                    
                
                FavAndShareView()
            }
            
            ScalableImages(images: model.detViewModel?.images ?? [], selected: $selected,model: model)
            VStack(alignment: .leading) {
                HStack{
                    VStack(alignment : .leading){
                        Text(model.detViewModel?.name ?? "No data")
                            .font(.custom("Montserrat-Medium", size: 18))
                        Text("Sneakers")
                            .font(.custom("Montserrat-Medium", size: 18))
                    }
                    Spacer()
                    Text("$" + String(model.detViewModel?.price ?? 0))
                        .font(.custom("Montserrat-Medium", size: 18))

                }.padding()
                Text(model.detViewModel?.description ?? "")
                    .frame(width: screenSize.width/1.5)
                    .font(.custom("Montserrat-ExtraLight", size: 12))
                    .foregroundColor(.gray)
                    .padding()
                    .padding(.top,-20)

                HStack{
                    Image(systemName: "star")
                        .foregroundColor(.yellow)
                    Text(model.detViewModel?.rating ?? "0")
                        .font(.custom("Montserrat-ExtraLight", size: 15))

                    Text("(" + (model.detViewModel?.reviews ?? "") + "reviews" + ")")
                        .font(.custom("Montserrat-ExtraLight", size: 15))
                        .foregroundColor(.gray)

                }.padding()
                    .padding(.top,-20)

                Text("Color :")
                    .font(.custom("Montserrat-Medium", size: 15))
                    .foregroundColor(.gray)
                    .padding()
                    .padding(.top,-20)
                HStack(spacing: 15){
                    Rectangle()
                        .frame(width: 30,height: 25)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .shadow(color: .black, radius: 1)
                    Rectangle()
                        .frame(width: 30,height: 25)
                        .foregroundColor(.gray)
                        .cornerRadius(5)
                        .shadow(color: .black, radius: 1)
                    Rectangle()
                        .frame(width: 30,height: 25)
                        .foregroundColor(.black)
                        .cornerRadius(5)
                        .shadow(color: .black, radius: 1)
                } .padding()
                    .padding(.top,-20)


            }
            Spacer()
            AddToCart().frame(width: screenSize.width)
          

            }.padding()
            .toolbar(.hidden)
            
        }
    }


struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}



