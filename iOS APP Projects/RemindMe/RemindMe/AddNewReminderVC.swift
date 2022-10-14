//
//  AddNewReminderVC.swift
//  RemindMe
//
//  Created by admin on 14/09/22.
//

import UIKit

class AddNewReminderVC: UIViewController {

    
    @IBOutlet weak var titleL: UITextField!
    
    @IBOutlet weak var descriptionL: UITextField!
    
    @IBOutlet weak var dateL: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
        
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func submitButton(_ sender: Any) {
        
        let title = titleL.text ?? ""
        let description = descriptionL.text ?? ""
      
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
       // let date = dateFormatter.date(from: "\(dateL.date)") ?? Date()
        let newDate = dateFormatter.string(from: dateL.date )
   
        
        //time
        dateFormatter.dateFormat = "h : mm a"
        //let time = dateFormatter.date(from: "\(dateL)") ?? Date()
        let newTime = dateFormatter.string(from: dateL.date)
        
        reminder.append(NewReminder(title: title, desc: description, date: newDate, time: newTime))
        print("Array added..")
        print("\(title) \(description) \(newDate) \(newTime)")
        
        
//        let vc = storyboard?.instantiateViewController(withIdentifier: "displayReminder") as! CustomReminderVC
//        vc.reminder.append(new)
//        //vc.tbl.reloadData()
//        show(vc, sender: self)
        
        if ReminderDBUtility.instance.addReminder(title: title, desc: description, date: newDate, time: newTime){
            
            showAlert(msg: "Reminder Added Successfully", title: "SUCCESS") {
                self.navigationController?.popViewController(animated: false)
            }
        }else {
            showAlert(msg: "Failed to Add Reminder", title: "FAILURE", okHandler: nil)
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
