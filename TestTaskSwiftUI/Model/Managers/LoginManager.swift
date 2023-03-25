//
//  LoginManager.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 24.03.2023.
//

import Foundation

    
enum LoginsCases {
    case succes
    case alreadyRegister
    case noLogin
    case wrongPassword
    case emptyField
    case invalidEmail
    case none
}

final class LoginManager {
    
    @Published var loginState : LoginsCases = .none
    
    
    
    let defaults = UserDefaults.standard
    
     var currentUsers : [String:String] = ["key":"value"] {
        didSet {
            defaults.set(currentUsers, forKey: "users")
        }
    }
    
    init() {
        loadFromDefaults()
    }
    
    
    func login(with login:String,with password : String) {
        if checkHaveUser(login: login, password: password) {
            if currentUsers[login] == password {
                loginState = .succes
            } else {
                loginState = .wrongPassword
            }
        } else {
            loginState = .noLogin
        }
        
    }
    
    func signIn( login:String, password : String,email : String) {
        if checkHaveUser(login: login, password: password) {
            self.loginState = .alreadyRegister
        } else {
            currentUsers[login] = password
            self.loginState = .succes
        }
    }
    
    private  func loadFromDefaults() {
       
        if let loaded = defaults.object(forKey: "users") {
            currentUsers = loaded as! [String : String]
        }

        
    }
    
    private func checkHaveUser(login:String, password: String) -> Bool {
        return currentUsers.keys.contains(login)
    }
    
    
}
