//
//  DataTransform.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 23.03.2023.
//

import Foundation
import Combine
import SwiftUI


final class DataManager : ObservableObject {
    
    @Published var state : ModelState = .loading
    
    @Published var latestViewModel : [LatestViewModel] = []
    @Published var flashSaleViewModels : [FlashSaleViewModel] = []
    
    private let imageLoader = ImageLoader()
    
    private let network = APIcaller()
    
    private var cancellables : Set<AnyCancellable> = []
    
    
    func getData () {
        
        Publishers.Zip(network.getFlashSalesData(), network.getLatestProductsData())
            .sink { completion in
                print(completion)
            } receiveValue: { (FlashSaleModel, LatestModel) in
                self.transformData(latestModel: LatestModel, flashModel: FlashSaleModel)
            }
            .store(in: &cancellables)

        
       
        
        
    }

    private func transformData(latestModel : LatestModel,flashModel : FlashSaleModel) {
        var latest : [LatestViewModel] = []
        var flash : [FlashSaleViewModel] = []
        latestModel.latest.forEach { good in
            latest.append(LatestViewModel(category: getCategory(for: good.category), image: good.imageUrl, price: String(Int(good.price)), name: good.name))
        }
        flashModel.flash_sale.forEach { product in
            flash.append(FlashSaleViewModel(category: getCategory(for: product.category), image: product.imageUrl, price: String(product.price), name: product.name, discount: String(product.discount)))
        }
        DispatchQueue.main.async {
            self.latestViewModel = latest
            self.flashSaleViewModels = flash
            self.state = .ok
        }
    }
    
    }
    
    
    func getCategory(for name : String) -> Category {
        switch name {
        case "Phones":
            return .phones
        case "Games":
            return .games
        case "Cars":
            return .cars

        case "Kids":
            return .kids

        case "Furniture":
            return .furniture

        case "Headphones":
            return .headphones
        default:
            return .other

        }
    }
    

