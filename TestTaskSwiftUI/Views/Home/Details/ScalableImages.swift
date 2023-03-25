//
//  ScalableImages.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 25.03.2023.
//

import SwiftUI

struct ScalableImages: View {
    
    var images : [String]
    
    @Binding var selected : Int

    var model : DetailsViewModel?
    
    var body: some View {
        
        
            HStack(spacing: 5) {
                ForEach(images, id: \.self) { imageUrl in
                    Spacer()
                    if selected == images.firstIndex(of: imageUrl) {
                        
                        AsyncImage(url: URL(string: imageUrl))  { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image.resizable()
                                    .scaledToFill()
                                
                            case .failure:
                                Image(systemName: "photo")
                            @unknown default:
                                // Since the AsyncImagePhase enum isn't frozen,
                                // we need to add this currently unused fallback
                                // to handle any new cases that might be added
                                // in the future:
                                EmptyView()
                                
                            }
                        }   .frame(width: 65,height: 40)
                            .cornerRadius(10)
                            .shadow(radius: 1)
                            .cornerRadius(10)
                            .scaleEffect(selected == images.firstIndex(of: imageUrl)  ? 1.5 : 1.0)
                            
                    } else {
                        AsyncImage(url: URL(string: imageUrl))  { phase in
                            switch phase {
                                
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image.resizable()
                                    .scaledToFill()
                                
                            case .failure:
                                Image(systemName: "photo")
                            @unknown default:
                                // Since the AsyncImagePhase enum isn't frozen,
                                // we need to add this currently unused fallback
                                // to handle any new cases that might be added
                                // in the future:
                                EmptyView()
                                
                            }
                        }
                            .frame(width: 65, height: 40)
                            .cornerRadius(10)

                            .onTapGesture {
                                withAnimation(.easeIn(duration: 0.05)) {
                                    selected = images.firstIndex(of: imageUrl)!
                                    model?.move = selected
                                }
                            }
                    }
                    Spacer()
                }
            }
            .frame(width: 100,height: 65)
            
            
        
        
        
        }
}

struct ScalableImages_Previews: PreviewProvider {
    static var previews: some View {
        ScalableImages(images: ["    https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/3613ebaf6ed24a609818ac63000250a3_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_01_standard.jpg",    "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/a94fbe7d8dfb4d3bbaf9ac63000135ed_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_03_standard.jpg",    "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/1fd1b80693d34f2584b0ac6300034598_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_05_standard.jpg"


], selected: .constant(1))
    }
}
