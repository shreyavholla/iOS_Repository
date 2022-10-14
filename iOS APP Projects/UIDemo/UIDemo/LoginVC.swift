//
//  LoginVC.swift
//  UIDemo
//
//  Created by admin on 09/09/22.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var unameT: UITextField!
    
    @IBOutlet weak var passT: UITextField!
    
    @IBOutlet weak var unameL: UILabel!
    
    @IBOutlet weak var passL: UILabel!
    
    var username:String = ""
    var uname:String?
    var password : String = ""
    var isForceEdit = false
    var isDataEntered = false
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("touched on view..")
        isForceEdit = true
        view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        unameT.text = "\(uname ?? "")"
        
        if(unameT.text == ""){
            
            unameT.becomeFirstResponder()
           
        }
        unameT.delegate = self
        passT.delegate = self
        
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginClick(_ sender: Any) {
        
        username = unameT.text ?? ""
        password = passT.text ?? ""
        
        if username.isEmpty || password.isEmpty {
            
            print("please enter all data")
            showAlert(title: "Error", msg: "please enter all data") {
                
                self.unameT.text = ""
            }
            isDataEntered = false
        }else if password.count < 4 {
            print("Please renter password")
            showAlert(title: "Password Error", msg: "Password must be greater than 4"){
                self.passT.text = ""
            }
            
        }
        else{
            print("Username : \(username), password: \(password)")
            isDataEntered = true
            
            //launching home vc
            
            if let vc = storyboard?.instantiateViewController(withIdentifier: "homevc") as? HomeVC{
            
                vc.name = username
                show(vc, sender: self)
            }
        }
    }
    
    //for popup notifications
    
    
    @IBAction func cancelClick(_ sender: Any) {
//        dismiss(animated: false) //works only on present modally
//        navigationController?.popViewController(animated: false) //works with show
        //?. optional chaining
        
        //OR
        
        unameT.text = ""
        passT.text = ""
    }
    
    //segue... you need function prepare and perform segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print("About to execute segue")
        //do this comparison when multiple segues
        if  segue.identifier == "loginSegue"{
            
            if let dest =  segue.destination as? HomeVC {//typecasting it to homevc{
                
                dest.name = username
            }
            
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
            return isDataEntered
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

extension LoginVC : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case unameT:
            print("Return key on username")
            passT.becomeFirstResponder()
        case passT :
            print("Return key on password")
            textField.resignFirstResponder()
        default:
            break
        }
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("ShouldEndEditing")
        let data = textField.text ?? ""
        switch textField {
        case unameT :
            let isValid =  validateUsername(data)
            if !isValid {
                unameL.textColor = .red
            }else {
                unameL.textColor = .green
            }
            return isValid
        case passT :
            let isValid = validatePassword(data)
            if !isValid {
                passL.textColor = .red
            }else{
                passL.textColor = .green
            }
            
        default:
            break
        }
        return true
    }
    
//    func validateUsername(_ uname: String)-> Bool{
//        if uname.isEmpty {
//            return false
//        }else if uname.count < 4{
//            return false
//        }
//
//        return true
//    }
//    func validatePassword(_ pwd: String) -> Bool{
//
//        if pwd.isEmpty{
//            return false
//        }else if pwd.count < 8{
//            return false
//        }
//
//        return true
//
//    }
}
