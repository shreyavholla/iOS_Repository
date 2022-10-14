//
//  LocationUtility.swift
//  LocationDemo
//
//  Created by admin on 23/09/22.
//

import Foundation
import CoreLocation

class LocationUtility: NSObject {
    
    let locationManager = CLLocationManager()
    var isAuthorized = false
    var currentLocation : CLLocation?
    var updatevc : ViewController?
    
    var firstLoc: CLLocation?

    
    override init(){
        
        super.init()
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        
       // locationManager.distanceFilter = 10 // meters
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.allowsBackgroundLocationUpdates = true
        
        
    }
    
    func startTracking() {
        
        print("Tracking Started")
        locationManager.startUpdatingLocation()
    }
    
    func stopTracking() {
        print("Tracking Stopped")
        locationManager.stopUpdatingLocation()
    }
}

//only applicable for classes
//inherited from NSObject

extension LocationUtility : CLLocationManagerDelegate {
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //latest location is the last value of the array locations
        if let latestLocation = locations.last {
            
            currentLocation = latestLocation
            var msg = "Location : \(latestLocation.coordinate.latitude), \(latestLocation.coordinate.longitude) "
            
            print(msg)
            
            //updatevc.updateLabel(msg: msg)
            
            if firstLoc == nil {
                
                firstLoc = latestLocation
            }else {
                
                let distInMtr = firstLoc!.distance(from: currentLocation!)
                msg.append(contentsOf: "\nDistance: \(distInMtr)")
                
                
            }
            updatevc?.updateLabel(msg: msg)
            
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
