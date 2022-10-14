//
//  CurrentLocationUtility.swift
//  WeatherDataApp
//
//  Created by admin on 29/09/22.
//

import Foundation
import CoreLocation

class CurrentLocationUtility : NSObject {
    
    let locationManager = CLLocationManager()
    var isAuthorized = false
    var currentLocation : CLLocation?
    var locUpdater : ViewController?

    
    override init(){
        
        super.init()
        
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.allowsBackgroundLocationUpdates = true
        
        locationManager.startUpdatingLocation()
        
        
    }
    

}

extension CurrentLocationUtility : CLLocationManagerDelegate {
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //latest location is the last value of the array locations
        if let latestLocation = locations.last {
            
            currentLocation = latestLocation
//            let msg = "Location : \(latestLocation.coordinate.latitude), \(latestLocation.coordinate.longitude) "
//            print("In location manager function")
           // print(msg)
           
            
            locUpdater?.getCurrentLocation()
            
            locationManager.stopUpdatingLocation()
        }
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
            
        case .notDetermined:
            print("Not Determinded..")
            isAuthorized = false
        case .denied:
            print("Denied...")
            isAuthorized = false
        case .restricted:
            print("Restricted...")
            isAuthorized = false
        case .authorizedAlways:
            print("Authorized Always...")
            isAuthorized = true
            
        case .authorizedWhenInUse:
            print("Authorized When In Use...")
            isAuthorized = true
            
        default:
            print("Unknown Status...")
            isAuthorized = false
        }
        
        
    }
    
}
