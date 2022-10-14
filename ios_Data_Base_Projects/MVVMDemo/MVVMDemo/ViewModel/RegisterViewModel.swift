//
//  RegisterViewModel.swift
//  MVVMDemo
//
//  Created by admin on 04/10/22.
//

import Foundation

final class RegisterViewModel {
    
    var error : ObservableObject<String?> = ObservableObject(nil)
    
    func register(fname: String, lname: String, email: String, password: String, conpass: String){
        
        NetworkService.shared.register(firstname: fname, lastname: lname, email: email, password: password, conpassword: conpass) { [weak self] success in
            self?.error.value = success ? nil : "INVALID DETAILS"
        }
    }
    
}
