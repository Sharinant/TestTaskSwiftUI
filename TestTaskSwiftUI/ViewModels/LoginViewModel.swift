//
//  LoginViewModel.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 20.03.2023.
//

import Foundation
import Combine

class LoginViewModel : ObservableObject {
    
    @Published var state : buttonState = .notOK
    
    private var coordinator : AppCoordinator?
    
    @Published var showAlert : Bool = false
    
    @Published var stateLogin : LoginsCases = .none
    
    var cancellable : Set<AnyCancellable> = []

    
    
    
    @Published var firstName = ""
    @Published var password = ""
    
    private let loginManager = LoginManager()
    
    
    private var firstNameIsValidPublisher : AnyPublisher<Bool , Never> {
        
        $firstName
            .map{value in
                !value.isEmpty
            }
            .eraseToAnyPublisher()
        
    }
    
    private var passwordIsValidPublisher : AnyPublisher<Bool , Never> {
        
        $password
            .map{value in
                !value.isEmpty
            }
            .eraseToAnyPublisher()
        
    }
    
    func loginWithError() {
        stateLogin = .emptyField
        showAlert = true
    }
    
    private func subscribe() {
        loginManager.$loginState
            .sink(receiveValue: { state in
                self.stateLogin = state
                if state == .none || state == .succes {
                    self.showAlert = false
                } else {
                    self.showAlert = true
                }
            })
            .store(in: &cancellable)
        
        
        $stateLogin.sink { loginCase in
            if loginCase == .succes {
                self.coordinator?.push(page: .tabView)
                self.firstName = ""
                self.password = ""
            }
        }.store(in: &cancellable)
    }
    
    init() {
        subscribe()
        
        firstNameIsValidPublisher
                .combineLatest(passwordIsValidPublisher)
                .map { value1,value2 in
                    value1 && value2
                }
                .map { state -> buttonState in
                    if state {
                        return .ok
                        
                    } else {
                        
                        return .notOK
                        
                    }
                }
                .assign(to: \.state, on: self)
                .store(in: &cancellable)
    }
    
    func pressedLoginAction() {
        loginManager.login(with: firstName, with: password)
        
        
    }
    
    func setup(coordinator : AppCoordinator){
        self.coordinator = coordinator
    }
    
    func pressSignIn() {
        coordinator?.pop()
        firstName = ""
        password = ""
    }
    
    func messageToAlert() -> String {
        switch stateLogin {
        case .succes:
         return   ""
        case .alreadyRegister:
          return  "Already registered! Go login"
        case .noLogin:
          return  "No user, sign in"
        case .wrongPassword:
            return  "Wrong password"
        case .none:
            return ""
        case .emptyField:
            return  "Empty fields"
        case .invalidEmail:
            return ""
        }
    }
}
