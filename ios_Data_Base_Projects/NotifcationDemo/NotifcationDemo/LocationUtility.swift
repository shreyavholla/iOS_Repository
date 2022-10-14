//
//  LocationUtility.swift
//  NotifcationDemo
//
//  Created by admin on 26/09/22.
//

import Foundation
import CoreLocation


class LocationUtility : NSObject {
    
    let locationManager = CLLocationManager()
    var isAuthorized = false
    
    override init(){
        
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        //locationManager.startMonitoringSignificantLocationChanges()
    }
}

extension LocationUtility : CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
       
        switch locationManager.authorizationStatus {
            
        case .denied :
            print("Location Access Denied")
            isAuthorized = false
            
        case .notDetermined :
            print("Location Access Not Determined")
            isAuthorized = false
            
        case .authorizedAlways :
            print("Location Access Granted authorize always")
            isAuthorized = true
            
        case .authorizedWhenInUse :
            print("Location Access When in use")
            isAuthorized = true
            
        case .restricted :
            print("Location Access Restricted")
            isAuthorized = false
            
        default :
            print("Unknown Location error")
            break
        }
    }
}
