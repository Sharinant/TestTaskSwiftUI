//
//  DetailsInfoManager.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 25.03.2023.
//

import Foundation
import Combine

final class DetailsNetworker {
    let url = URL(string: "https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239")!
    
    
    func getLatestProductsData() -> AnyPublisher<detailsModel,Error> {
        
        let publisher = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: detailsModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
        return publisher
    }
    
    
    
}
