//
//  ImageLoader.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 23.03.2023.
//

import Foundation
import Combine
import SwiftUI

class ImageLoader: ObservableObject {
    
    @Published var image : UIImage = UIImage()
    
    func loadImage(urlString : String) {
    //    let data = Data()
       // load(urlString: urlString)
    }

    func load (urlString : String)   {
        
        
        guard let url = URL(string: urlString) else { return}
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, self != nil else { return }
            
            DispatchQueue.main.async {
                self?.image = UIImage(data: data) ?? UIImage()
            }
            
            
        }
        task.resume()
    }
    
    func loadSome(url : String) -> AnyPublisher<UIImage,URLError> {
        let publisher = URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
            .map(\.data)
            .map { data in
                UIImage(data: data)!
            }
            .eraseToAnyPublisher()
        return publisher
    }
    
}
