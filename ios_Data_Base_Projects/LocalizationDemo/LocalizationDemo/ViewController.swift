//
//  ViewController.swift
//  LocalizationDemo
//
//  Created by admin on 26/09/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    
    @IBAction func continueClicked(_ sender: Any) {
        
        let alertTitle = NSLocalizedString("success_title", tableName: "MyStrings", bundle: .main, value: "", comment: "")
        
        let alertMsg = NSLocalizedString("login_message", tableName: "MyStrings", bundle: .main, value: "", comment: "")
        
        let okButton = NSLocalizedString("button_title", tableName: "MyStrings", bundle: .main, value: "", comment: "")
        
        
        let alertVC = UIAlertController(title: alertTitle, message: alertMsg, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: okButton, style: .default)
        
        alertVC.addAction(okAction)
        
        present(alertVC, animated: false)
    }
    
}

