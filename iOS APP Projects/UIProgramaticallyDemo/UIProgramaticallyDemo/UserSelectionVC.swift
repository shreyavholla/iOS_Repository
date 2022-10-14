//
//  UserSelectionVC.swift
//  UIProgramaticallyDemo
//
//  Created by admin on 15/09/22.
//

import UIKit

class UserSelectionVC: UIViewController {

    
    @IBOutlet weak var msgL: UILabel!
    
    
    @IBOutlet weak var priceL: UILabel!
    
    
    @IBOutlet weak var progressL: UIProgressView!
    
    @IBOutlet weak var gpsMsgL: UILabel!
    
    
    @IBOutlet weak var valueL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //segment controller
    @IBAction func userAction(_ sender: UISegmentedControl) {
        
        let roleId =  sender.selectedSegmentIndex
        let user = sender.titleForSegment(at: roleId)
        print("Role changed to \(user ?? "")")
        msgL.text = "Welcome \(user ?? "") "
    }
    
    //slider
    @IBAction func PriceSelector(_ sender: UISlider) {
        
        

            let stepCount = 100
            let roundedCurrent = (sender.value/Float(stepCount)).rounded()
            let newValue = Int(roundedCurrent) * stepCount
            sender.setValue(Float(newValue), animated: true)
            priceL.text = "Your price is \(Int(sender.value))"
            
            
        
    }
    
    
    @IBAction func GPSChanged(_ sender: UISwitch) {
        var switchBtn = ""
        if sender.isOn {
            switchBtn = "ON"
                }else {
                    switchBtn = "OFF"
                }
    print("GPS Setting changed to \(switchBtn)")
        
        gpsMsgL.text = "GPS Setting changed to \(switchBtn)"
    }
    
    
    @IBAction func StepperChanged(_ sender: UIStepper) {
        let value = sender.value
        
        valueL.text = "\(value)"
        progressL.progress = Float(value/100)
        //progress bar works from 0 - 1 in increments of 0.1
    
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
