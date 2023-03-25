//
//  SignInViewModel.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 20.03.2023.
//

import Foundation
import Combine
import SwiftUI

enum buttonState {
    case ok
    case notOK
}

class SigInViewModel : ObservableObject {
    
    private var coordinator : AppCoordinator?
    
    
    @Published var showAlert : Bool = false
    
    @Published var stateLogin : LoginsCases = .none
    
    
    private let loginManager = LoginManager()
    
   
    
    @Published var state : buttonState = .notOK
  
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var eMail = ""
    
    private var cancellables : Set <AnyCancellable> = []
    
    private var firstNameIsValidPublisher : AnyPublisher<Bool , Never> {
        
        $firstName
            .map{value in
                !value.isEmpty
            }
            .eraseToAnyPublisher()
        
    }
    
    private var lastNameIsValidPublisher : AnyPublisher<Bool , Never> {
        
        $lastName
            .map{value in
                !value.isEmpty
            }
            .eraseToAnyPublisher()
        
    }
    
    private var emailIsValidPublisher : AnyPublisher<Bool , Never> {
        
        $eMail
            .map{value in
                !value.isEmpty && value.isEmail()
            }
            .eraseToAnyPublisher()
        
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
            .store(in: &cancellables)
        
    }
    
    func setup(coordinator : AppCoordinator) {
        self.coordinator = coordinator
    }
    
    init() {
        
    subscribe()
        
    firstNameIsValidPublisher
            .combineLatest(lastNameIsValidPublisher, emailIsValidPublisher)
            .map { value1,value2,value3 in
                value1 && value2 && value3
            }
            .map { state -> buttonState in
                if state {
                    return .ok
                    
                } else {
                    
                    return .notOK
                    
                }
            }
            .assign(to: \.state, on: self)
            .store(in: &cancellables)
        
        
            
    }
    
    func pressSignInWithError() {
        
        if eMail.isEmail()  {
            stateLogin = .emptyField
            showAlert = true
        } else if eMail.isEmpty {
            stateLogin = .emptyField
            showAlert = true
        } else {
            stateLogin = .invalidEmail
            showAlert = true
        }
        
    }
    
    func pressSignInAction() {
        loginManager.signIn(login: firstName, password: lastName, email: eMail)
        $stateLogin.sink { loginCase in
            if loginCase == .succes {
                self.coordinator?.push(page: .tabView)
            }
        }.store(in: &cancellables)
        firstName = ""
        lastName = ""
        eMail = ""
    }

    func pressHaveAccountAction() {
        coordinator?.push(page: .loginView)
        firstName = ""
        lastName = ""
        eMail = ""
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
        case .emptyField :
            return "Empty fields"
        case .none:
            return  ""
        case .invalidEmail:
            return "Invalid email"
        }
    }
    
}
