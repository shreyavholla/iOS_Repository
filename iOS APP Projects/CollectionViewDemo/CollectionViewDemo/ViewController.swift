//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by admin on 15/09/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        let vc = segue.destination as! AnimalVC
        
        if segue.identifier == "domesticSegue"
        {
            vc.animalType = "Domestic"
        }else{
            vc.animalType = "Wild"
        }
    }


}

