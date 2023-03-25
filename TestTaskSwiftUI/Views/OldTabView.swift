//
//  TabView.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 22.03.2023.
//

import SwiftUI

struct OldTabBarView: View {
    
    @EnvironmentObject private var coordinator : AppCoordinator
    
    var body: some View {
        
        TabView {
            coordinator.buildView(page: .firstTab)
                .environmentObject(coordinator)
                .tabItem {
                    Image("homeTab")
                        .padding(.top,20)
                }
            coordinator.buildView(page: .secondTab)
                .tabItem {
                    Image("heartTab")
                    
                }
            coordinator.buildView(page: .thirdTab)
                .tabItem {
                    Image("cartTab")
                }
            coordinator.buildView(page: .fourthTab)
                .tabItem {
                    Image("chatTab")
                }
            coordinator.buildView(page: .fifthTab)
                .tabItem {
                    Image("profileTab")
                }
        }.environmentObject(coordinator)
            .toolbar(.hidden)
            
    }
        
    }


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        OldTabBarView().environmentObject(AppCoordinator())
    }
}
