//
//  HomeViewController.swift
//  MVVMDemo
//
//  Created by admin on 04/10/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var welcomeMsgL: UILabel!
    
    private var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        setupBinders()
        viewModel.getLoggedInUserDetails()

        // Do any additional setup after loading the view.
    }
    
    private func setupBinders(){
        
        viewModel.welcomeMsg.bind { message in
            self.welcomeMsgL.text = message
        }
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
