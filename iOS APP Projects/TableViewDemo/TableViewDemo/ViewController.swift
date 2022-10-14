//
//  ViewController.swift
//  TableViewDemo
//
//  Created by admin on 14/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var connectB: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let btAction = UIAction(title: "Bluetooth", image: nil, identifier: nil, discoverabilityTitle: nil, attributes: .destructive, state: .off) { _ in
            print("Connecting via Bluetooth...")
        }
        
        let wifiAction = UIAction(title: "Wi-fi", image: nil, identifier: nil, discoverabilityTitle: nil, attributes: .destructive, state: .off) { _ in
            print("Connecting via Wifi...")
        }
        
        let nfcAction = UIAction(title: "NFC", image: nil, identifier: nil, discoverabilityTitle: nil, attributes: .destructive, state: .off) { _ in
            print("Connecting via NFC...")
        }
        
        connectB.menu = UIMenu(title: "Connect Via", image: nil, identifier: nil, options: .displayInline, children: [btAction,wifiAction,nfcAction])
        
        //single click touch down for single click
        connectB.showsMenuAsPrimaryAction = true
    }


}

