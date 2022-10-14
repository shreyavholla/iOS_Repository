//
//  GeoCodingUtility.swift
//  WeatherDataApp
//
//  Created by admin on 28/09/22.
//

import Foundation
import CoreLocation

struct GeoCodingUtility{
    
    func getCoordinate(address: String, callback: @escaping (CLLocation?)-> Void) {
        
        CLGeocoder().geocodeAddressString(address) { placeList, err in
            
            guard err == nil else {
                
                print("Forward Geocoding failed.. \(err!.localizedDescription)")
                return
            }
            
            guard let places = placeList else {
                callback(nil)
                return
            }
            
            let place = places[0]
            
            if let location = place.location {
                
                print("Converted Lattitude : \(location.coordinate.latitude)\nConverted Longitude : \(location.coordinate.longitude)")
                
                callback(location)
                return
            }
            
            callback(nil)
            
        }
        
    }
    
    
    func getAddress(lattitude: Double, longitude: Double, callback: @escaping (String)->Void){
        
        let loc = CLLocation(latitude: lattitude, longitude: longitude)
        
        CLGeocoder().reverseGeocodeLocation(loc) { placeList, err in
            
            guard err == nil else {
                
                print("Reverse GeoCoding Conversion Failed.. \(err!.localizedDescription) ")
                return
            }
            
            guard let places = placeList else{
                
                return
            }
            
            let place = places[0]
            
            let address = "\(place.name ?? "")"
            //\(place.subLocality ?? ""), \(place.locality ?? ""), \(place.country ?? "") - \(place.postalCode ?? "")"
            
            
            callback(address)
            
            
            
        }
        
        
        
    }
    
}
