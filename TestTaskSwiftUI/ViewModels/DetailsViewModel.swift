//
//  DetailsViewModel.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 25.03.2023.
//

import SwiftUI
import Foundation
import Combine

struct DetViewModel{
    var name : String
    var description : String
    var rating : String
    var price : Int
    var reviews : String
    
//    var colors : [Color]
    var images : [String]
    
}

final class DetailsViewModel : ObservableObject {
    
    @Published var images : [UIImage] = []
    
    @Published var move = 0
    @Published var detViewModel : DetViewModel?
    
    private var cancellable : Set<AnyCancellable> = []
    
    private let network = DetailsNetworker()
    
    init() {
        getData()
    }

    func getData() {
        network.getLatestProductsData()
            .receive(on: RunLoop.main)
            .sink { completion in
                
            } receiveValue: { detailsModel in
                
                self.detViewModel = DetViewModel(name: detailsModel.name, description: detailsModel.description, rating: String(detailsModel.rating), price: detailsModel.price, reviews: String(detailsModel.number_of_reviews),images: detailsModel.image_urls)
                print(detailsModel.image_urls)
            }.store(in: &cancellable)

    }
    
    func loadImages(images : [String]) {
        images.forEach { url in
            
        }
    }
    
    
}

