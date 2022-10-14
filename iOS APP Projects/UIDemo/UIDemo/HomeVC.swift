//
//  HomeVC.swift
//  UIDemo
//
//  Created by admin on 12/09/22.
//

import UIKit

class HomeVC: UIViewController {

    
    @IBOutlet weak var msgL: UILabel!
    
    var name : String?
    override func viewDidLoad() {
        super.viewDidLoad()

        msgL.text = "Welcome \(name ?? "")"
        // Do any additional setup after loading the view.
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
