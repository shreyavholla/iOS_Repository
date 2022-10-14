//
//  ViewController.swift
//  UIDemo
//
//  Created by admin on 08/09/22.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var titleL: UILabel!
    
   
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    
    @IBOutlet var logoL: UIView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // screen not displayed... but views are ready
        //executed only once
       
        //titleL.text = "iOS Application Development"
        titleL.text = titleL.text?.uppercased()
        button4.setTitle("Continue", for: .normal)
//        logoL.image = UIImage(systemName: "tray.circle")
       // print("ViewController: viewDidLoad")
        
        
    }
    
    @IBAction func btnClick(_ sender: Any) {
        
        titleL.text = "Continuing..."
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //print("ViewController: viewWillAppear => going to appear")
        //reloads data
        //gets data from db
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       // print("ViewController: viewDidAppear =>  has appeared")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       // print("ViewController: viewWillDisappear => going to disappear")
        
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
       // print("ViewController: viewDidDisappear => has disappeared")
    }
    
    
}

