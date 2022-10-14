//
//  ViewController.swift
//  LocationDemo
//
//  Created by admin on 23/09/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var infoL: UILabel!
    
    
    @IBOutlet weak var startB: UIButton!
    
    
    @IBOutlet weak var stopB: UIButton!
    
    
    
    let locUtility = LocationUtility()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locUtility.updatevc = self
       
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        if !locUtility.isAuthorized {
//             //disable the button
//
//            startB.isEnabled = false
//            stopB.isEnabled = false
//            infoL.text = "Location Access Denied, please go to Settings > Privacy > Locations > Enable Location for Location Demo App"
//        }else {
//            startB.isEnabled = true
//            stopB.isEnabled = true
//            infoL.text = "Location Tracking About to Start..."
//            view.reloadInputViews()
//        }
//    }

    
    @IBAction func startTracking(_ sender: Any) {
        
        locUtility.startTracking()
        startB.isEnabled = false
        if locUtility.isAuthorized {
            
            //start Tracking
            print("Start Tracking..")
            infoL.text = "Clicked Start to Start Tracking"
            
            
            
            
        }else {
            
            showAlert(title:"Not Authorized", msg: "please go to Settings > Privacy > Locations > Enable Location for Location Demo App")
        }
    }
    
    func updateLabel(msg: String)
    {
        infoL.text = msg
    }
    
    @IBAction func stopTracking(_ sender: Any) {
        
        locUtility.stopTracking()
        startB.isEnabled = true
    }
    
    
    
    @IBAction func showAddress(_ sender: Any) {
        
        let addr = locUtility.currentLocation?.coordinate
        
        if let lat = addr?.latitude, let long = addr?.longitude {
            
            GeoCodingUtility().getAddress(lattitude: lat, longitude: long) { address in
                
                self.infoL.text = address
            }
        }else {
            
            showAlert(title: "Location Error", msg: "Location not available")
        }
        
        
    }
    
    /*
     
     URL SCHEMES --------------
     For More information visit, Apple URL Scheme Reference
     http: browser, map
     tel : phone application
     sms : messaging app
     mailto : email
     
     */
     
    
    @IBAction func showmapClicked(_ sender: Any) {
        
        
        //with phone app *****
        
       // let urlS = "tel:9421250159"
       // let urlS = "sms:9421250159"
        let urlS = "mailto:mandara.s@Synchronoss.com"
        if let url = URL(string: urlS) {
                        //opening map
                        if  UIApplication.shared.canOpenURL(url){
        
                            //launch if true
                            UIApplication.shared.open(url)
        
                        }else {
        
                            showAlert(title: "Map Error", msg: "No Phone App")
                        }
                    }
        
        //********
//        if let currentL = locUtility.currentLocation?.coordinate{
//
//
//            //show map
//            let urlS = "http://maps.apple.com/?ll=\(currentL.latitude),\(currentL.latitude)&z=20"
//
//            if let url = URL(string: urlS) {
//                //opening map
//                if  UIApplication.shared.canOpenURL(url){
//
//                    //launch if true
//                    UIApplication.shared.open(url)
//
//                }else {
//
//                    showAlert(title: "Map Error", msg: "No Map Application")
//                }
//            }
//
//
//        }else{
//
//            showAlert(title: "Location Unknown", msg: "Start Tracking Location First")
//        }
    }
}

