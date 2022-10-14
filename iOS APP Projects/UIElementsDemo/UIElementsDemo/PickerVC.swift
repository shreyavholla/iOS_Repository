//
//  PickerVC.swift
//  UIElementsDemo
//
//  Created by admin on 13/09/22.
//

import UIKit



class PickerVC: UIViewController {

    
    @IBOutlet weak var cityPicker: UIPickerView!
    
    @IBOutlet weak var cityL: UILabel!
    
    //let cityList = ["Bangalore", "Mangalore", "Pune", "Panjim", "Hyderabad"]
    let stateList = ["Karnataka", "Maharastra", "Goa", "Andhra Pradesh"]
    
    let karList = ["Bangalore", "Mangalore", "Udupi", "Sringeri"]
    let goaList = ["Panjim", "Mapsua", "Margao", "Vasco"]
    let mhList = ["Mumbai", "Pune", "Gurgao","Vasai"]
    let apList = ["Tirupati", "Vishakapatnam", "Hyderabad","Hindupur"]
    
    var cityList : [String] = []
    var selectedState = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityList = karList
        
        cityPicker.dataSource = self
        cityPicker.delegate = self
        // first delegate cityPicker to itself
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

extension PickerVC: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2 //one wheel //one component
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //no of rows in component = 0
        
        switch component {
        case 0:
            return stateList.count
        case 1:
            return cityList.count
        default:
            break
        }
        return 0
        
       
    
}
}

extension PickerVC: UIPickerViewDelegate {
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch component {
        case 0 :
            return stateList[row]
        default:
            return cityList[row]
        }
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        // cityL.text = "Selected City : \(cityList[row])"
        
        switch component{
        case 0 :
            selectedState = stateList[row]
            switch row {
            case 0 :
                cityList = karList
            case 1 :
                cityList = mhList
            case 2 :
                cityList = goaList
            case 3 :
                cityList = apList
                
            default:
                break
            }
        default:
            cityL.text = "Selected Place :   \(selectedState) - \(cityList[row])"
        }
        pickerView.reloadComponent(1)
    }
        
}
