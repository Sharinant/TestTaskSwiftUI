//
//  APICaller.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 22.03.2023.
//

import Foundation
import Combine


final class APIcaller  {
    
    let urlLatest = URL(string: "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7")!
    let urlSales = URL(string: "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac")!
    
    
    func getLatestProductsData() -> AnyPublisher<LatestModel,Error> {
        
        let publisher = URLSession.shared.dataTaskPublisher(for: urlLatest)
            .map(\.data)
            .decode(type: LatestModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
        return publisher
    }
    
    func getFlashSalesData() -> AnyPublisher<FlashSaleModel,Error> {
        
        let publisher = URLSession.shared.dataTaskPublisher(for: urlSales)
            .map(\.data)
            .decode(type: FlashSaleModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        return publisher
    }
    
    
    
    
}
