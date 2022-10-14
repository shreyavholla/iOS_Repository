//
//  Utilities.swift
//  RemindMe
//
//  Created by admin on 14/09/22.
//

import Foundation
import UIKit

struct NewReminder {
    var title : String
    var desc : String
    var date : String
    var time : String
}

var reminder : [NewReminder] = []

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
