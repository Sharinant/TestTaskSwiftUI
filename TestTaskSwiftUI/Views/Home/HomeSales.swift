//
//  ContentView.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 20.03.2023.
//

import SwiftUI

struct HomeSales: View {
    
    @EnvironmentObject private var coordinator : AppCoordinator
    @ObservedObject private var model = HomeViewModel()
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        
        
        switch model.state {
        case .loading:
            LoadingView()
        case .ok:
            
            VStack {
                HomeNavigationBar()
                    .padding(.top,-10)
                TextField("What are you looking for ?", text: $model.searchText)
                    .font(.custom("Montserrat-ExtraLight", size: 14))
                    .multilineTextAlignment(.center)
                
                    .frame(width: screenSize.width/1.5)
                
                    .padding(10)
                    .background(homeSearchBarColor)
                    .cornerRadius(20)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 20){
                        ForEach(model.categories) { category in
                            CategoriesView(category: category)
                                .frame(width: 45)
                        }
                    }.padding(10)
                        .padding(.bottom,-20)
                }
                
                ScrollView(.vertical) {
                    
                    
                    
                    HStack{
                        Text("Latest")
                            .font(.custom("Montserrat-Medium", size: 14))
                            .foregroundColor(.black)
                        
                        Spacer()
                        Text("View all")
                            .font(.custom("Montserrat-ExtraLight", size: 11))
                            .foregroundColor(.gray)
                    }.padding(.leading,10)
                        .padding(.trailing,10)
                        .padding(.bottom,-10)
                    ScrollView(.horizontal) {
                        
                        HStack(spacing: 12){
                            
                            
                            ForEach(model.latestModels, id: \.name) { latest in
                                LatestCellView(model: latest)
                            }
                            //
                            //                    ForEach(model.latestMock,id: \.name) { latest in
                            //                            LatestCellView(model: latest)
                            
                            //                       }
                        }.padding(10)
                    }
                    HStack{
                        Text("Flash Sale")
                            .font(.custom("Montserrat-Medium", size: 14))
                            .foregroundColor(.black)
                        Spacer()
                        Text("View all")
                            .font(.custom("Montserrat-ExtraLight", size: 11))
                            .foregroundColor(.gray)
                    }.padding(.leading,10)
                        .padding(.trailing,10)
                        .padding(.bottom,-10)
                    ScrollView(.horizontal) {
                        
                        HStack(spacing: 15){
                            ForEach(model.flashSaleModels,id: \.name) { flash in
                                FlashSaleView(model: flash).environmentObject(coordinator)
                            }
                        }.padding(10)
                    }
                    HStack{
                        Text("Brands")
                            .font(.custom("Montserrat-Medium", size: 14))
                            .foregroundColor(.black)
                        Spacer()
                        Text("View all")
                            .font(.custom("Montserrat-ExtraLight", size: 11))
                            .foregroundColor(.gray)

                    }.padding(.leading,10)
                        .padding(.trailing,10)
                    
                    
                    ScrollView(.horizontal) {
                        HStack{
                            Image("brand1")
                                .scaledToFill()
                                .cornerRadius(20)
                            Image("brand2")
                                .scaledToFill()
                                .cornerRadius(20)
                            Image("brand3")
                                .scaledToFill()
                                .cornerRadius(20)
                            Image("brand1")
                                .scaledToFill()
                                .cornerRadius(20)
                        } .frame(height: 120)
                            .padding(10)
                            .padding(.top,-30)
                    }
                    
                    
                }
            }
            .background(signInScreenBackColor)
            
        }
    }
}

struct HomeSales_Previews: PreviewProvider {
    static var previews: some View {
        HomeSales().environmentObject(AppCoordinator())
    }
}


