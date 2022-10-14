//
//  LoginVC.swift
//  RemindMe
//
//  Created by admin on 19/09/22.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var unameT: UITextField!
    
    @IBOutlet weak var passT: UITextField!
    
    @IBOutlet weak var loginB: UIButton!
    
    @IBOutlet weak var registerB: UIButton!
    
    func setUpStackViews() {
        
        if let credentials = getCredentials() {
            
            print("Credentials.... \nUsername: \(credentials.userid)\nPassword: \(credentials.password)")
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "displayReminder") as! CustomReminderVC
            
            vc.msg = "Welcome \(credentials.userid)" 
           
            show(vc, sender: self)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpStackViews()

        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
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
    
    
    @IBAction func registerClicked(_ sender: Any) {
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
