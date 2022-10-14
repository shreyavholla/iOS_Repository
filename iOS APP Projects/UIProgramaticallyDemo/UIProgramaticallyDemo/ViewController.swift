//
//  ViewController.swift
//  UIProgramaticallyDemo
//
//  Created by admin on 15/09/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonClick(_ sender: Any) {
        
        //launching dynamic screen in class
        let vc = DynamicVC()
        show(vc, sender: self)
    }
}

