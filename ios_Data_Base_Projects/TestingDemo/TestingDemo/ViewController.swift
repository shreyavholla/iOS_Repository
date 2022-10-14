//
//  ViewController.swift
//  TestingDemo
//
//  Created by admin on 29/09/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameL: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitClicked(_ sender: Any) {
        
        let uname = nameL.text ?? ""
        
        if uname.isEmpty{
            
            print("Enter a name to continue")
        }else{
            
            let vc = storyboard?.instantiateViewController(identifier: "welcomename") as! WelcomeNameVC
            
            vc.name = uname
            
            present(vc, animated: false)
        }
    }
    
}

