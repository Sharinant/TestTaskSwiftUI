//
//  ProfileView.swift
//  teststate
//
//  Created by Антон Шарин on 19.03.2023.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    
    @ObservedObject private var viewModel = ProfileViewModel()
    
    @State var imageData : Data?
    @State var selectedItems : [PhotosPickerItem] = []
    
    @EnvironmentObject var coordinator : AppCoordinator
    
    fileprivate func createCelltest(with model : profileCell) -> some View {
        return Button {
            viewModel.pushButton(from : model)
                
        } label: {
            HStack{
                model.image
                
                Text(model.rawValue)
                    .font(.custom("Montserrat-Regular", size: 16))
                    .foregroundColor(.black)

                Spacer()
                
                if model == .balance {
                    Text("$ " + viewModel.balance)
                        .font(.custom("Montserrat-Regular", size: 16))
                        .foregroundColor(.black)
                } else {
                    model.rightButton
                        .foregroundColor(.black)
                }
                
            }
        }

    }
    
    var body: some View {
        
            VStack{
                ProfileNavBar()
                    .padding(.bottom,25)
               
                VStack(spacing: 0) {
                    
                    if let imageData = imageData {
                        Image(uiImage: UIImage(data: imageData)!)
                            .resizable()
                            .frame(width: 40,height: 40)
                            .clipShape(Circle())
                            .padding()
                        
                    } else {
                        Image("person")
                            .shadow(radius: 1)
                            .padding()
                    }
                    
                    Text("Change photo")
                        .font(.custom("Montserrat-Thin", size: 10))
                        .padding(.top,-10)
                }
                    
                Text("Satria Adhi Pradana")
                    .font(.custom("Montserrat-Medium", size: 14))
                    .padding()
                    
                    PhotosPicker(selection: $selectedItems, maxSelectionCount: 1, selectionBehavior: .default, matching: .images, preferredItemEncoding: .automatic) {
                        Image(systemName: "square.and.arrow.up")
                            .font(.custom("Montserrat-Bold", size: 16))
                            .padding(.trailing,30)
                        Text("Upload item")
                            .font(.custom("Montserrat-Bold", size: 16))
                            .padding(.trailing,30)
                    }.onChange(of: selectedItems, perform: { newValue in
                       
                        guard let item = selectedItems.first else {return}
                        item.loadTransferable(type: Data.self) { result in
                            switch result {
                            case .success(let data):
                                self.imageData = data
                            case .failure(let error):
                                print(error)
                            }
                        }
                        
                    })

                .frame(height: 50)
                .frame(width: screenSize.width * 0.8)
                    .background(signInButtonColor)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                VStack(spacing: 20){
                    createCelltest(with: .tradeStore)
                    createCelltest(with: .paymentMethod)
                    createCelltest(with: .balance)
                    createCelltest(with: .tradeHistory)
                    createCelltest(with: .restorePurchase)
                    createCelltest(with: .help)
                    createCelltest(with: .logOut)

                }
                .padding(30)
            
            
            }.padding(.bottom,12)
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(signInScreenBackColor)
            .onAppear{
                viewModel.setup(coordinator: coordinator)
            }

            
    }
    
}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(AppCoordinator())
    }
}
