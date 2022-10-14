//
//  WebKitVC.swift
//  Adaptive Layout Demo
//
//  Created by admin on 16/09/22.
//

import UIKit
import WebKit

class WebKitVC: UIViewController {

    @IBOutlet weak var webV: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let pageUrl = URL(string: "https://synchronoss.com")!
        webV.load(URLRequest(url:pageUrl ))
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
