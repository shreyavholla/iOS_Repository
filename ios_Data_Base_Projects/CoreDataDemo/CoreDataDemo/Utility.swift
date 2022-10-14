//
//  Utility.swift
//  CoreDataDemo
//
//  Created by admin on 20/09/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(msg: String, title: String, okHandler: (()->Void)?) {
        
        let alertVC = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            
            okHandler?()

        }
        
        alertVC.addAction(okAction)
        
        present(alertVC, animated: false)
        
       
        
    }
}
