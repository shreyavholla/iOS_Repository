//
//  PListStorage.swift
//  DataStorageDemo
//
//  Created by admin on 19/09/22.
//

import Foundation

func getServerPath() -> String? {
    
    guard let url = Bundle.main.url(forResource: "Settings", withExtension: "plist") else {
        
        print("Setting file not found")
        return nil
    }
    
    let contents = try! Data(contentsOf: url)
    
    let plist = try! PropertyListSerialization.propertyList(from: contents, format: .none) as! NSDictionary
    
    return plist["serverUrl"] as? String

}

func getWaitTime() -> Int? {
    
    guard let url = Bundle.main.url(forResource: "Settings", withExtension: "plist") else {
        
        print("Setting file not found")
        return nil
    }
    
    let contents = try! Data(contentsOf: url)
    
    let plist = try! PropertyListSerialization.propertyList(from: contents, format: .none) as! NSDictionary
    
    return plist["waitTime"] as? Int
    
    
}
