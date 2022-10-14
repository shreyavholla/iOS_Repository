//
//  KeychainStorage.swift
//  DataStorageDemo
//
//  Created by admin on 19/09/22.
//

import Foundation


func addCredentials(userid: String, password: String) {
    
    let pwdData = password.data(using: .utf8)!
    
    let item : [String: Any] = [kSecClass as String : kSecClassGenericPassword,
                                kSecValueData as String : pwdData,
                                kSecAttrAccount as String : userid
                                
    ]
    
   let status = SecItemAdd(item as CFDictionary, nil)
    
    guard status == errSecSuccess else {
        
        print("Adding item failed")
        return
    }
    print("Keychain item added")
}

func getCredentials() -> (userid: String, password: String)? {
    
    var result :CFTypeRef?
    
    let query : [String: Any] = [kSecClass as String : kSecClassGenericPassword,
                                 kSecReturnAttributes as String : true,
                                 kSecReturnData as String: true
    ]
    let status = SecItemCopyMatching(query as CFDictionary, &result) //pointers are : & in objective c
    
    guard status != errSecItemNotFound else {
        
        print("Password not found...")
        return nil
    }
    
    guard status == errSecSuccess else {
        
        print("Failed to retrieve Credentials...")
        return nil
    }
    
    guard let foundItem = result as? [String: Any] else {
        
        return nil
    }
    
    let passwordData = foundItem[kSecValueData as String] as! Data
    let userid = foundItem[kSecAttrAccount as String] as! String
    
    let password = String(data: passwordData, encoding: .utf8)!
    
    return (userid,password)
    
}

func deleteCredentials() {
    
    let item : [String: Any] = [kSecClass as String : kSecClassGenericPassword]
    let status = SecItemDelete(item as CFDictionary)
    
    guard  status == errSecSuccess else{
        
        print("Deletion failed")
        return
    }
    
    print("Password deleted...")
}
