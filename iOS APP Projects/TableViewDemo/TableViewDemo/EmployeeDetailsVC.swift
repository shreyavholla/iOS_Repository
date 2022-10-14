//
//  EmployeeDetailsVC.swift
//  TableViewDemo
//
//  Created by admin on 14/09/22.
//

import UIKit

class EmployeeDetailsVC: UIViewController {

    @IBOutlet weak var detailsL: UILabel!
    
    var empDetails: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailsL.text = empDetails
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
