//
//  RegisterViewController.swift
//  MVVMDemo
//
//  Created by admin on 04/10/22.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var fnameL: UITextField!
    
    @IBOutlet weak var lnameL: UITextField!
    
    @IBOutlet weak var emailL: UITextField!
    
    @IBOutlet weak var passL: UITextField!
    
    @IBOutlet weak var conpassL: UITextField!
    
    
    private let viewModel = RegisterViewModel()
    
    override func viewDidLoad() {
       
        setupBinders()
        super.viewDidLoad()
        fnameL.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    
    private func setupBinders(){
        
        viewModel.error.bind {  error in
            if let error = error {
                print(error)
            }else {
                self.goToLoginPage()
            }
        }
    }
    private func goToLoginPage(){
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "loginview") as! LoginViewController
        present(vc, animated: false)
    }
    
    @IBAction func registerBtnClicked(_ sender: Any) {
        
        guard let fname = fnameL.text,
              let lname = lnameL.text,
              let email = emailL.text,
              let password = passL.text,
              let conpassword = conpassL.text else{
            
            showAlert(title: "Please fill all the details", msg: "")
            return
        }
        
        viewModel.register(fname: fname, lname: lname, email: email, password: password, conpass: conpassword)
                
                
    }
    
  

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
