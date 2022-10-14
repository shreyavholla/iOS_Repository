//
//  LoginViewModel.swift
//  MVVMDemo
//
//  Created by admin on 04/10/22.
//

import Foundation

final class LoginViewModel{
    
    var error : ObservableObject<String?> = ObservableObject(nil)
    
    
    func login(email: String, password: String){
        print("in login view model")
        NetworkService.shared.login(email: email, password: password) { [weak self]  success in
           self?.error.value = success ? nil :  "INVALID CREDENTIALS"
            
        }
        
    }
}
