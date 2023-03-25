//
//  ProfileViewModel.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 22.03.2023.
//

import Foundation
import SwiftUI

enum profileCell : String {
    case tradeStore = "Trade store"
    case paymentMethod = "Payment method"
    case balance = "Balance"
    case tradeHistory = "Trade history"
    case restorePurchase = "Restore purchase"
    case help = "Help"
    case logOut = "Log out"
    
    var image : Image {
        switch self {
            
        case .tradeStore:
            return Image("tradeStore")
        case .paymentMethod:
            return Image("tradeStore")

        case .balance:
            return Image("tradeStore")

        case .tradeHistory:
            return Image("tradeStore")

        case .restorePurchase:
            return Image("restorePurchase")

        case .help:
            return Image("help")

        case .logOut:
            return Image("logOut")

        }
    }
    
    var rightButton : Text {
        switch self {
        case .tradeStore:
            return Text("❯")
        case .paymentMethod:
            return Text("❯")

        case .balance:
            return Text("$ 1593")
            
        case .tradeHistory:
            return Text("❯")

        case .restorePurchase:
            return Text("❯")

        case .help:
            return Text("")
        case .logOut:
            return Text("")

        }
    }

}


class ProfileViewModel : ObservableObject {
    
    private var coordinator : AppCoordinator?
    
  
    
    @Published var balance = "1593"
    
    func setup(coordinator : AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func pushButton(from : profileCell) {
        
        switch from{
            
        case .tradeStore:
       //     coordinator?.push(page: .empty)
            break
        case .paymentMethod:
       //     coordinator?.push(page: .empty)
            break
        case .balance:
       //     coordinator?.push(page: .empty)
            break
        case .tradeHistory:
        //    coordinator?.push(page: .empty)
            break
        case .restorePurchase:
         //   coordinator?.push(page: .empty)
            break
        case .help:
         //   coordinator?.push(page: .empty)
            break
        case .logOut:
            coordinator?.logOut()
            
        }
        
        
    }

    
    
}
