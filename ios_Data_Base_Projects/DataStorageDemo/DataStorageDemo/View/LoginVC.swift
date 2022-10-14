//
//  LoginVC.swift
//  DataStorageDemo
//
//  Created by admin on 19/09/22.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var unameL: UITextField!
    
    @IBOutlet weak var passL: UITextField!
    
    @IBOutlet weak var loginB: UIButton!
    
    @IBOutlet weak var logoutB: UIButton!
    
    //user defaults class
    
    let uDefaults = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Home Dir : \(NSHomeDirectory())")
        
        // Do any additional setup after loading the view.
        
        setUpButtons()
    }
    
    func setUpButtons() {
        
        if let username = uDefaults.string(forKey: "userid")  {
            
            //logged in
            loginB.isEnabled = false
            logoutB.isEnabled = true
            
            unameL.text = username
            passL.isHidden = true
            
            
        }else{
            //not logged in -- first time
            loginB.isEnabled = true
            logoutB.isEnabled = false
            
            unameL.text = ""
            passL.isHidden = false
            
        }
    
        
      
        
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        //get username and password and save to user-defaults,
       //location: dir file location > Library > Preferences > p-List folder
        let username = unameL.text ?? ""
        let password = passL.text ?? ""
        
        //checking if both are entered
        if(username.isEmpty || password.isEmpty)
        {
            print("Enter all the data")
            //add an alert here later to tell user
        }else{
            
            //set the key value pair with userdefaults
            uDefaults.set(username, forKey: "userid")
            uDefaults.set(password, forKey: "password")
            print("Credentials saved...")
        }
        
        
        loginB.isEnabled = false
        logoutB.isEnabled = true
        
    }
    
    
    @IBAction func logoutButton(_ sender: Any) {
        
        loginB.isEnabled = true
        logoutB.isEnabled = false
        passL.isHidden = true
        
        uDefaults.removeObject(forKey: "userid")
        uDefaults.removeObject(forKey: "password")
        
     
        
       

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
