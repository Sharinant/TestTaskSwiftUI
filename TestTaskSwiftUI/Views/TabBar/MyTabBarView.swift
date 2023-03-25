//
//  TabBarView.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 24.03.2023.
//

import SwiftUI

struct MyTabBarView: View {
    
    @EnvironmentObject private var coordinator : AppCoordinator

    
    @State private var selectedTab : Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack{
            
            VStack {
                TabView(selection: $selectedTab) {
                    switch selectedTab {
                        
                    case .house:
                        coordinator.buildView(page: .firstTab)
                            .environmentObject(coordinator)
                    case .favorites:
                        coordinator.buildView(page: .secondTab)
                    case .cart:
                        coordinator.buildView(page: .thirdTab)

                    case .chat:
                        coordinator.buildView(page: .fourthTab)

                        
                    case.profile:
                        coordinator.buildView(page: .fifthTab)
                            .environmentObject(coordinator)


                    
            
                    }
                }.environmentObject(coordinator)
                    .toolbar(.hidden)
            }
            
            VStack {
                Spacer()
                CustomTabBarView(selectedTab: $selectedTab)
                    .environmentObject(coordinator)
                    
            }.environmentObject(coordinator)
            .padding(.bottom, -35)

        }
        
        
    }
}

struct MyTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabBarView().environmentObject(AppCoordinator())
    }
}
