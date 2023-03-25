//
//  LoginView.swift
//  teststate
//
//  Created by Антон Шарин on 18.03.2023.
//

import SwiftUI

struct LoginView: View {
    
   @StateObject private var model = LoginViewModel()
    
    @EnvironmentObject private var coordinator : AppCoordinator

    
    fileprivate func createTextFields(placeholder:String, @State property : String) -> some View {
        return TextField(placeholder, text: $property)
            .foregroundColor(.black)
            .padding()
            .multilineTextAlignment(.center)
            .frame(height: 30)
            .background(signInTextFieldBackColor)
            .cornerRadius(20)
            .frame(width: 0.8 * screenSize.width)
    }
    
    var body: some View {
        
        GeometryReader{_ in
            VStack(alignment: .center) {
                Spacer()
                Text("Welcome back")
                    .font(.custom("Montserrat-SemiBold", size: 26))
                    .padding(.bottom,80)


                
                VStack(spacing: 35){
                    
                    SignInTextField(title: "First name", text: $model.firstName)
                    SecureInputView("Password", text: $model.password)
                }.frame(width: 0.8 * screenSize.width)
                    .padding(.bottom,100)
               
                
                    VStack(alignment: .leading, spacing: 10){
                        
                        Button(action: {
                            
                            switch model.state {
                            case .notOK:
                                model.loginWithError()
                            case .ok:
                                model.pressedLoginAction()
                            }
                        }, label: {
                            Text("Login")
                                .font(.custom("Montserrat-Bold", size: 15))
                        })
                        .padding()
                        .frame(height: 50)
                            .frame(width: 0.8 * screenSize.width)
                            .foregroundColor(.white)
                            .background(signInButtonColor)
                            .cornerRadius(15)
                        HStack{
                            Text("No account? ")
                                .font(.custom("Montserrat-Light", size: 12))
                                
                            
                                
                            Button {
                                coordinator.pop()
                            } label: {
                                Text("Sign in")
                                    .font(.custom("Montserrat-Medium", size: 12))
                            }

                                 
                            
                            


                        }.onAppear{
                            model.setup(coordinator: coordinator)
                        }
                    }.padding(.bottom,300)
                

                   Spacer()
            }
            .alert("Attention", isPresented: $model.showAlert, actions: {
                
            }, message: {
                Text(model.messageToAlert())
            })
            .frame(maxWidth: screenSize.width,maxHeight: screenSize.height)
            .background(signInScreenBackColor)
            .toolbar(.hidden)
        }.ignoresSafeArea(.keyboard,edges: .bottom)
        

       
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(AppCoordinator())
    }
}


struct SecureInputView: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $text)
                        .font(.custom("Montserrat-Regular", size: 15))
                        .foregroundColor(.black)
                        .padding()
                        .multilineTextAlignment(.center)
                        .frame(height: 30)
                } else {
                    TextField(title, text: $text)
                        .font(.custom("Montserrat-Regular", size: 15))
                        .foregroundColor(.black)
                        .padding()
                        .multilineTextAlignment(.center)
                        .frame(height: 30)
                }
            }

            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
            }.padding(.trailing)
        }                        .background(signInTextFieldBackColor)
            .cornerRadius(20)

    }
}
