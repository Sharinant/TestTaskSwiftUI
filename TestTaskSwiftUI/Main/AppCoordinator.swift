//
//  AppCoordinator.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 20.03.2023.
//

import Foundation
import SwiftUI


enum Pages : String, Identifiable {
    
    case empty
    
    //SignInView
    case signIn
    
    //LoginView
    case loginView
    
    //case TabView
    
    case tabView
    
    //TabViews
    case firstTab, secondTab, thirdTab, fourthTab, fifthTab

    //DetailsView
    case firstDetails
    
    var id: String {
        self.rawValue
    }
}


class AppCoordinator : ObservableObject {
    @Published var path = NavigationPath()
    
    func push(page: Pages) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
        
    }
    
    func logOut() {
        
        path.append(Pages.signIn)
        path.removeLast(path.count)
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
   
    
    @ViewBuilder func buildView(page : Pages) -> some View {
        
        switch page {
            
        case .tabView:
            MyTabBarView()
            
        case .firstTab:
            HomeSales()
        case .secondTab:
            EmptyView()
        case .thirdTab:
            EmptyView()
        case .fourthTab:
            EmptyView()
        case .fifthTab:
            ProfileView()
            
            
        case .signIn:
            SignInView()
        case .loginView:
            LoginView()
       
            
            
        case .firstDetails:
            DetailsView()
            
        case .empty :
            EmptyView()
        }
        
    
        
    }
}
