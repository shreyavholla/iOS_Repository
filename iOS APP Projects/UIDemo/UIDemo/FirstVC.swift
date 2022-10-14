//
//  FirstVC.swift
//  UIDemo
//
//  Created by admin on 09/09/22.
//

import UIKit

class FirstVC: UIViewController {

    var isRegistered = false
    var isLoggedIn = true
    
    @IBOutlet weak var loginB: UIButton!
    
    @IBOutlet weak var cancelB: UIButton!
    
    @IBOutlet weak var signupB: UIButton!
    
    override func viewDidLoad() {
        print("FirstVC:viewDidLoad")
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if isRegistered {
            signupB.isEnabled = false
            if isLoggedIn{
                loginB.isEnabled = false
            }else{
                cancelB.isEnabled = false
            }
        }else{
            loginB.isHidden = false
            cancelB.isHidden = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("First VC: viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("First VC: viewDidAppear ")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("First VC: viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("First VC: viewDidDisappear")
    }
    
    //common outlet button to every one
    @IBAction func btnClick(_ sender: UIButton) {
        
        //print("btn clicked")
        switch sender {
            
        case loginB :
            loginClick()
        case cancelB :
            cancelClick()
        case signupB :
            signupClick()
        default :
            break
        }
    }
    
    
    func loginClick() {
        print("Login btn touched")
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "loginvc") {
            
            //show or present
            //show(vc, sender: self)
            present(vc, animated: false)
            
        }
    }
    
    
    
    func cancelClick() {
        print("Cancel btn touched")
    }
    
    func signupClick() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "signupvc"){
            
            present(vc, animated: false)
        }
       
    }
    
    
    @IBAction func cancelBtn(_ sender: Any) {
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
