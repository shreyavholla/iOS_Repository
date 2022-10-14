//
//  SignupVC.swift
//  UIDemo
//
//  Created by admin on 10/09/22.
//

import UIKit

class SignupVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var unameT: UITextField!
    
    @IBOutlet weak var passT: UITextField!
    
    @IBOutlet weak var confirmpassT: UITextField!
    
    @IBOutlet weak var fnameT: UITextField!
    
    
    @IBOutlet weak var addressT: UITextView!
    
    
    @IBOutlet weak var pincodeT: UITextField!
    
    @IBOutlet weak var phonenoT: UITextField!
    
    @IBOutlet weak var unameL: UILabel!
    
    var isForceEdit = false
    var username: String = ""
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("touched on view..")
        isForceEdit = true
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        unameT.becomeFirstResponder()
        
        unameT.delegate = self
        passT.delegate = self
        confirmpassT.delegate = self
        fnameT.delegate = self
        addressT.delegate = self
        pincodeT.delegate = self
        phonenoT.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signUpClick(_ sender: Any) {
        
        username = unameT.text ?? ""
        let password = passT.text ?? ""
        let conpass = confirmpassT.text ?? ""
        let fullname = fnameT.text ?? ""
        let address = addressT.text ?? ""
        let pincode = pincodeT.text ?? ""
        let phoneno = phonenoT.text ?? ""
        
        if username.isEmpty || password.isEmpty || conpass.isEmpty || fullname.isEmpty || address.isEmpty || address.isEmpty || pincode.isEmpty || phoneno.isEmpty{
            
            print("Please enter all the data")
//            showAlert(title: "Error", msg: "Pease enter all the data", handler: {
//                return
//            })
            //launching loginvc
            
            
        }
        else {
            print("username:\(username) password:\(password) fullname:\(fullname) address:\(address) pincode:\(pincode) mobile:\(phoneno)")
            
            if let vc = storyboard?.instantiateViewController(withIdentifier: "loginvc") as? LoginVC{
                
                vc.uname = username
                present(vc, animated: false)
            }
        
        
        
    }
    }
    
    
    @IBAction func cancelClick(_ sender: Any) {
        dismiss(animated: false)
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

extension SignupVC : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case unameT:
            print("Return key on username")
            passT.becomeFirstResponder()
        case passT :
            print("Return key on password")
            confirmpassT.becomeFirstResponder()
        case confirmpassT :
            print("Return key on confirm password")
            fnameT.becomeFirstResponder()
        case fnameT :
            print("Return key on fullname")
            addressT.becomeFirstResponder()
        case addressT:
            print("Return key on address")
            pincodeT.becomeFirstResponder()
        case pincodeT :
            print("Return key on pincode")
            phonenoT.becomeFirstResponder()
        case phonenoT :
            print("Return key on phone number")
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
        case passT:
            let isValid = validatePassword(data)
            if !isValid {
                passT.textColor = .red
                
            }else{
                passT.textColor = .green
                
            }
        case confirmpassT:
            if confirmpassT.text != passT.text {
                print("Password not matching")
                showAlert(title: "Password Error", msg: " Both passwords do not match") { 
                    self.confirmpassT.text = ""
                    self.passT.text = ""
                }
                confirmpassT.textColor = .red
                
            }
            else{
                confirmpassT.textColor = .green
            }
        case pincodeT:
            let isValid = validatePincode(data)
            if !isValid {
                pincodeT.textColor = .red
                
            }else{
                pincodeT.textColor = .green
                
            }
        case phonenoT:
            let isValid = validatePhoneno(data)
            if !isValid {
                phonenoT.textColor = .red
                
            }else{
                phonenoT.textColor = .green
                
            }
            
        default:
            break
        }
        return true
    }
    
    func validateUsername(_ uname: String)-> Bool{
        if uname.isEmpty {
            return false
        }else if uname.count < 4{
            return false
        }
        
        return true
    }
    func validatePassword(_ pwd: String) -> Bool{
        
        if pwd.isEmpty{
            return false
        }else if pwd.count <= 4 || pwd.count >= 8{
            showAlert(title: "Password Error", msg: "Password must be between 4 to 8") {
                self.confirmpassT.text = ""
                self.passT.text = ""
            }
            return false
        }
        
//        if pwd2.isEmpty{
//            return false
//        }else if pwd2.count < 8{
//            return false
//        }
//
//        guard pwd1 == pwd2 else {
//            return false
//        }
        
        return true
        
    }
    
    func validatePhoneno(_ ph: String) -> Bool {
        
        for no in ph {
            let n = no.asciiValue ?? 0
            if(n < 48 || n > 57)
            {
                print("Invalid Phone number")
                showAlert(title: "Phone No Error", msg: "Phone no must be digits") {
                    self.phonenoT.text = ""
                }
                return false
            }
           
        }
        if ph.count != 10 {
            print("Invalid Phone number")
            showAlert(title: "Phone No Error", msg: "Phone no must have 10 digits") {
                self.phonenoT.text = ""
            }
            return false
        }
        
        return true
    }
    
    func validatePincode(_ pin: String) -> Bool {
        
        for no in pin {
            let n = no.asciiValue ?? 0
            if(n < 48 || n > 57)
            {
                print("Invalid Postal code")
                showAlert(title: "Pincode Error", msg: "Pin Code must be digits") {
                    
                    self.pincodeT.text = ""
                    
                }
                return false
            }
           
        }
        if pin.count != 6 {
            print("Invalid Postal code")
            showAlert(title: "Pincode Error", msg: "Pin Code must have 6 digits") {
                
                self.pincodeT.text = ""
                
            }
            return false
        }
        
        return true
    }
    
    
}
