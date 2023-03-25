//
//  CustomTabBar.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 24.03.2023.
//

import SwiftUI


enum Tab: String, CaseIterable {
    
    case house
    case favorites
    case cart
    case chat
    case profile
    
    var image : Image {
        switch self {
            
        case .house:
            return Image("homeTab")
        case .favorites:
            return Image("heartTab")

        case .cart:
            return Image("cartTab")

        case .chat:
            return Image("chatTab")

        case .profile:
            return Image("profileTab")

        }
    }
    
    
}

struct CustomTabBarView: View {
    
    @EnvironmentObject var coordinator : AppCoordinator
    
    @Binding var selectedTab : Tab

    var body: some View {
    
        VStack{
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    if selectedTab == tab {
                        tab.image
                            .frame(width: 40, height: 40)
                            .scaleEffect(selectedTab == tab ? 1.15 : 1.0)
                            .background(CircleBackground())
                    } else {
                        tab.image
                            .onTapGesture {
                                withAnimation(.easeIn(duration: 0.2)) {
                                    selectedTab = tab
                                }
                            }
                    }
                    Spacer()
                }
            }
            .frame(width: nil,height: 65)
            .background(Color.white)
            .cornerRadius(20)
            
        }
        
        
        }
}

struct CustomTabBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack{
            Spacer()
            CustomTabBarView(selectedTab: .constant(.house)).environmentObject(AppCoordinator())
        }
    }
}
