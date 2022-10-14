//
//  UiUtilities.swift
//  TableViewDemo
//
//  Created by admin on 14/09/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title: String?, msg: String?, handler: (()-> Void)?){
        
        let alertVC = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            handler?()
        }
        
        alertVC.addAction(okAction)
        
        present(alertVC, animated: false)
    }
}

//Structure for employee list

struct Employee {
    var empId: Int
    var name: String
    var city: String
    var salary: Int
}
