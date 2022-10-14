//
//  DatePickerVC.swift
//  UIElementsDemo
//
//  Created by admin on 13/09/22.
//

import UIKit

class DatePickerVC: UIViewController {

    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var dateL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
       
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func dobChanged(_ sender: Any) {
        
        let  selection = datePicker.date
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd - MM - yyyy"
        let date = dateFormat.string(from: selection)
        
        dateL.text = "DOB : \(date)"
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



