//
//  NetworkService.swift
//  MVVMDemo
//
//  Created by admin on 04/10/22.
//

import Foundation

final class NetworkService {
  
    static let shared = NetworkService() //singleton
    var user : User?
    
  private init() { }
  
    func register(firstname: String, lastname: String, email: String, password: String, conpassword: String, completion: @escaping(Bool)->Void){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            if firstname.isEmpty || lastname.isEmpty || email.isEmpty || password.isEmpty || conpassword.isEmpty {
                
                self.user = nil
                print("Compulsion to fill in all details")
                completion(false)
            }else if password != conpassword{
                
                self.user = nil
                print("Password incorrent")
                completion(false)
                
            }else{
                
                self.user?.firstname = firstname
                self.user?.lastname = lastname
                self.user?.email = email
                self.user?.password = password
                print("Saved to structure User")
                completion(true)
            }
        }
        
    }

    func login(email: String, password: String, completion: @escaping(Bool)->Void){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
           
            guard let user = self.user else{
                
                return
            }
            
            if email == user.email && password == user.password {
                completion(true)
            }else{
                
                completion(false)
            }
        }
    }
    
    func getLoggedInUserDetails() -> User?{
        
        guard let user = user else{
            return nil
        }
        
        return user
    }
    
    
}
