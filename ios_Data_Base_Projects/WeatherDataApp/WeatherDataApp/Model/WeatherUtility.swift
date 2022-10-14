//
//  WeatherUtility.swift
//  WeatherDataApp
//
//  Created by admin on 27/09/22.
//

import Foundation

struct WeatherData : Codable{
    
    var lat : Double
    var lon : Double
    var timezone : String
    var current : Current
    var hourly : [Hourly]
    var daily : [Daily]
    
    
}

struct Current : Codable{
    
    var dt : Double
    var sunrise : Double
    var sunset : Double
    var temp : Double
    var pressure : Double
    var humidity : Double
    var dew_point : Double
    var wind_speed : Double
    
    var weather : [Weather]
}

struct Weather : Codable{
    
    var id : Int
    var main : String
    var description : String
    var icon : String
}
struct Hourly : Codable{
    var dt : Double
    var temp : Double
    var humidity : Double
    var clouds : Int
    var weather : [Weather]
    
}
struct Daily : Codable{
    
    var dt : Double
    var sunrise : Double
    var sunset : Double
    var moonrise : Double
    var moonset : Double
    var temp : Temp
    var weather : [Weather]
}

struct Temp: Codable{
    var day : Double
    var min : Double
    var max : Double
    var night : Double
    var morn : Double
}
