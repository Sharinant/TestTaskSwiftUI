//
//  HomeSalesViewModel.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 22.03.2023.
//

import Foundation
import SwiftUI
import Combine


struct LatestViewModel {
    var category : Category
    var image : String
    var price : String
    var name : String
}

struct FlashSaleViewModel {
    var category : Category
    var image : String
    var price : String
    var name : String
    var discount : String
}

enum ModelState {
    case loading
    case ok
}

class HomeViewModel : ObservableObject {
    
    @Published var state : ModelState = .loading
    
    @State var searchText : String = ""
    
    var cancellable : Set<AnyCancellable> = []
    
    @Published var latestModels : [LatestViewModel] = []
    @Published var flashSaleModels : [FlashSaleViewModel] = []
    
    private let dataManager = DataManager()

    init() {
       

        getData()
        
    }
    
    func getData() {
        dataManager.getData()
        dataManager.$latestViewModel
            .assign(to: \.latestModels, on: self)
            .store(in: &cancellable)
        dataManager.$flashSaleViewModels
            .assign(to: \.flashSaleModels, on: self)
            .store(in: &cancellable)
        dataManager.$state
            .assign(to: \.state, on: self)
            .store(in: &cancellable)
    }
    
   
        
        
    
        var categories : [Category] = [.phones,.headphones,.games,.cars,.furniture,.kids,.other]
        
//        var latestMock : [LatestViewModel] = [LatestViewModel(category: .cars, image: Image("123"), price: "50000", name: "Sony Playstation 5"),
//                                              LatestViewModel(category: .cars, image: Image("123"), price: "100", name: "XBOX ONE"),
//                                              LatestViewModel(category: .cars, image: Image("123"), price: "500", name: "BMW X6M"),
//                                              LatestViewModel(category: .cars, image: Image("123"), price: "1000", name: "Samsung S10"),
//        ]
        
    
}
