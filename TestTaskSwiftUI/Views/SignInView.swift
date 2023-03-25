//
//  ContentView.swift
//  teststate
//
//  Created by Антон Шарин on 14.03.2023.
//

import SwiftUI



struct SignInView: View {
        
    @StateObject private var model = SigInViewModel()
    
    @EnvironmentObject private var coordinator : AppCoordinator

    @State var showAlert : Bool = true
    
    enum typeOfSignIn {
        case google
        case apple
        case none
        
        var title : String {
            switch self {
            case .google:
                return "Google"
            case .apple:
                return "Apple"
            default:
                return ""
            }
        }
        
        var image: Image {
            switch self {
            case .google:
                return Image("google")
            case .apple:
                return Image("apple")
            default:
                return Image(systemName: "star")
            }
        }
    }
    
    
    var body: some View {
        
        GeometryReader{_ in
            NavigationStack(path: $coordinator.path) {
                
                
                VStack{
                    
                    
                    Text("Sign in ")
                        .font(.custom("Montserrat-SemiBold", size: 26))
                        .padding(78)
                    

                    VStack(spacing: 35) {
                        
                        SignInTextField(title: "First name", text: $model.firstName)
                            .submitLabel(.next)
                        SignInTextField(title: "Last name", text: $model.lastName)
                            .submitLabel(.next)
                        SignInTextField(title: "Email", text: $model.eMail)
                            .textContentType(.emailAddress)
                            .keyboardType(.emailAddress)
                        
                    }.onAppear{
                        model.setup(coordinator: coordinator)
                    }
                    .frame(width: 0.8 * screenSize.width)
                    
                        .padding(.bottom,35)
                
                    
                    createSignInAndLogin()
                        .padding(.bottom,85)
                    createSignInWith(with: .google)
                        .padding(.bottom,50)
                    createSignInWith(with: .apple)
                        .padding(.bottom, 130)
                    
                }.ignoresSafeArea(.keyboard,edges: .bottom)

                .alert("Attention", isPresented: $model.showAlert, actions: {
                    
                }, message: {
                    Text(model.messageToAlert())
                })
                .frame(maxWidth: .infinity,maxHeight: .infinity)
                    .background(signInScreenBackColor)
                    .environmentObject(coordinator)
                    .ignoresSafeArea(.keyboard,edges: .bottom)
                
                Spacer()
            }.toolbar(.hidden)
                .ignoresSafeArea(.keyboard,edges: .bottom)
        }.ignoresSafeArea(.keyboard,edges: .bottom)
        
    
        
    }
    fileprivate func createSignInWith(with company: typeOfSignIn) -> some View {
        
        return Button {
            //some action
        } label: {
            
            company.image
            
                        Text("Sign in with \(company.title)")
                            .font(.custom("Montserrat-Medium", size: 14))
                            .foregroundColor(.black)
        }
    }
    
    
    fileprivate func createSignInAndLogin() -> some View {
        return VStack(alignment: .leading, spacing: 10){
            
            Button(action: {
                switch model.state {
                case .notOK:
                    model.pressSignInWithError()
                case .ok:
                    model.pressSignInAction()

                }

            }, label: {
                Text("Sign In")
                    .font(.custom("Montserrat-Bold", size: 15))
            })
            .padding()
            .frame(height: 50)
                .frame(width: 0.8 * screenSize.width)
                .foregroundColor(.white)
                .background(signInButtonColor)
                .cornerRadius(15)
            HStack{
                Text("Already have an account? ")
                    .font(.custom("Montserrat-Light", size: 12))
                    
                Button {
                    //coordinator.push(page: .loginView)
                    model.pressHaveAccountAction()
                        
                } label: {
                    Text("Log in")
                        .font(.custom("Montserrat-Medium", size: 12))

                }

                    
//                        NavigationLink(destination: coordinator.buildView(page: .loginView)) {
//                            Text("Log in")
//                                .font(.custom("Montserrat-Medium", size: 12))
//
//                        }
                     
                
                


            }
        }
    }
    
}

struct SignInTextField : View {
    
    let title : String
    @Binding var text : String
    
    var body: some View {
        TextField(title, text: $text)
        .font(.custom("Montserrat-Regular", size: 15))
        .foregroundColor(.black)
        .padding()
        .multilineTextAlignment(.center)
        .frame(height: 30)
        .background(signInTextFieldBackColor)
        .cornerRadius(20)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView().environmentObject(AppCoordinator())
    }
}




