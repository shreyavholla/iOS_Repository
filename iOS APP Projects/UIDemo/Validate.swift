//
//  Validate.swift
//  UIDemo
//
//  Created by admin on 12/09/22.
//

import Foundation
import UIKit

func validatePassword(_ pwd: String) -> Bool{
   
    guard !pwd.isEmpty && pwd.count >= 8 else {
        return false
    }
    
    return true
}

func validateUsername(_ uname: String) -> Bool {
    if uname.isEmpty {
        return false
    } else if uname.count < 4 {
        return false
    }
    
    return true
}

extension UIViewController {
    func showAlert(title: String?, msg:String?,  handler: (()-> Void)? ){
        
        //alertVC is an object of UIAlertViewController class
        let alertVC = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        //creating an action
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            handler?()
        }
        alertVC.addAction(okAction)
        
        //cancel action
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("cancel executed")
        }
        alertVC.addAction(cancelAction)
        
        //submit action
//        let submitAction = UIAlertAction(title: "Submit", style: .default, handler: nil)
//        alertVC.addAction(submitAction)
//        
        present(alertVC, animated: false)
    }
}
