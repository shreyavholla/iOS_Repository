//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by admin on 20/09/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var idT: UITextField!
    
    @IBOutlet weak var nameT: UITextField!
    
    @IBOutlet weak var salaryT: UITextField!
    
    @IBOutlet weak var cityPicker: UIPickerView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("Home dir : \(NSHomeDirectory())")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
        cityPicker.dataSource = self
        cityPicker.delegate = self
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func AddEmpClicked(_ sender: Any) {
        
        let empId = idT.text ?? ""
        let empName = nameT.text ?? ""
        let cityIndex = cityPicker.selectedRow(inComponent: 0)
        let empCity = EmpDBUtility.cityList[cityIndex]
        let empSalary = salaryT.text ?? ""
        
        let id = Int(empId) ?? 0
        let salary = Float(empSalary) ?? 0.0
        
        if EmpDBUtility.instance.addEmployee(id: id, name: empName, city: empCity, salary: salary){
            
            showAlert(msg: "Employee \(empName) added", title: "SUCCESS", okHandler: {
                
                self.navigationController?.popViewController(animated: false)
            })
            
            
        }else{
            
            showAlert(msg: "\(empName) not added, same empid : \(id)", title: "FAILED TO ADD EMPLOYEE", okHandler: nil)
          
        }
        
       
    }
    
}

extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return EmpDBUtility.cityList[row]
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return EmpDBUtility.cityList.count
    }
    
    
    
}
