//
//  KeychainVC.swift
//  DataStorageDemo
//
//  Created by admin on 19/09/22.
//

import UIKit

class KeychainVC: UIViewController {

    @IBOutlet weak var unameT: UITextField!
    
    @IBOutlet weak var passT: UITextField!
    
    @IBOutlet weak var loginB: UIButton!
    
    @IBOutlet weak var logoutB: UIButton!
    
    @IBOutlet weak var welcomeMsgL: UILabel!
    
    @IBOutlet weak var loginStack: UIStackView!
    
    @IBOutlet weak var logoutStack: UIStackView!
    
    fileprivate func setUpStackViews() {
        
        if let credentials = getCredentials() {
            
            print("Credentials.... \nUsername: \(credentials.userid)\nPassword: \(credentials.password)")
            
           
            welcomeMsgL.text = "Welcome \(credentials.userid)"
            
            loginStack.isHidden = true
            logoutStack.isHidden = false
            
            
        }else {
            loginStack.isHidden = false
            logoutStack.isHidden = true
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpStackViews()
       

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        
        //save credentials in keyhain
        let username = unameT.text ?? ""
        let password = passT.text ?? ""
        
        if (username.isEmpty || password.isEmpty)
        {
            print("Enter all the data")
        }else {
            
            addCredentials(userid: username, password: password)
        }
        
        setUpStackViews()
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        
        deleteCredentials()
        setUpStackViews()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
