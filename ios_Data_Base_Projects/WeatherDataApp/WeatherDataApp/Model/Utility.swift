//
//  Utility.swift
//  WeatherDataApp
//
//  Created by admin on 28/09/22.
//

import Foundation
import UIKit

extension UIViewController{
    
    func showAlert(title: String, msg: String){
        
        let alertVC = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alertVC.addAction(okAction)
        
        present(alertVC, animated: false)
        
    }
    
    func convertUtcToTime(utc: TimeInterval) -> String {
        var date = Date()
        date = Date(timeIntervalSince1970: utc)
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        let newDate = formatter.string(from: date)
        return newDate
    }
    
    func convertUtcToDate(utc: TimeInterval) -> String{
        
        var date = Date()
        date = Date(timeIntervalSince1970: utc)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd LLL"
        let newDate = formatter.string(from: date)
        return newDate
    }
    
    func tempConversion(temp: Double, to: Int) -> String{
        
        var contemp: String = ""
        
        switch to{
            
        case 0:
            //"Cel"
            contemp = "\(round(10*(temp - 273.15))/10)°C"
        
        case 1:
            //"Farenheit"
            contemp = "\(round(10*((temp - 273.15) * 9/5 + 32))/10)°F"
            
        
        case 2:
            //"Kelvin"
            contemp = "\(round(10*temp)/10)°K"
            
        default:
            break
        }
        
        return contemp
    }
    
}
