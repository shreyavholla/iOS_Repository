//
//  Greeting.swift
//  TestingDemo
//
//  Created by admin on 29/09/22.
//

import Foundation


struct Greeting{
    
//    let firstname: String? = nil
//    let lastname: String? = nil
    
    func createGreeting(firstname: String?, lastname: String?) -> String? {
        

        guard let fname = firstname else{
            
            guard let lname = lastname else{
                
                return nil
            }
            
            return "Hello \(lname)"
        }
        
        guard let lname = lastname else{
            
            return "Hello \(fname)"
        }
        
        return "Good Day, Mr. \(fname) \(lname)"
    }
}
