//
//  LoginViewController.swift
//  MVVMDemo
//
//  Created by admin on 04/10/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var unameL: UITextField!
    
    @IBOutlet weak var passL: UITextField!
    
    private var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        
        setupBinders()
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    
    
    
    
    private func setupBinders(){
        
        viewModel.error.bind {  error in
            if let error = error {
                print("Error : \(error.description)")
            }else {
                print("Came here")
                self.goToHomePage()
            }
        }
    }
    
    private func goToHomePage(){
        
        print("in go to home page")
        let vc = storyboard?.instantiateViewController(withIdentifier: "homeview") as! HomeViewController
        present(vc, animated: false)
        
    }
    
    @IBAction func loginBtnClicked(_ sender: Any) {
        
        guard let email = unameL.text,
              let password = passL.text else{
            
            showAlert(title: "EMPTY FIELDS", msg: "Please enter email and password")
            return
        }
        print("Login Button Clicked")
        viewModel.login(email: email, password: password)
                
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
