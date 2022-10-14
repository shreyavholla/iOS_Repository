//
//  WeatherDataUtility.swift
//  TempCheck - The Weather App
//
//  Created by admin on 26/09/22.
//

import Foundation
import Alamofire

//singleton and private

struct WeatherDataUtility {
    
    let apiKey = "f6c40e0c3e23e9c2a1816b8b695f5b3e"
    let weathUrl = "https://api.openweathermap.org/data/2.5/onecall?"
    let lat = 33.44
    let long = -94.04
    
    static var instance = WeatherDataUtility()
    
    private init(){
        
    }
    
    func getWeatherData(handler : @escaping (WeatherData)-> Void){
        
       // let urlS = "\(weathUrl)lat=\(lat)&lon=\(long)&appid=\(apiKey)"
        let urlS = "https://api.openweathermap.org/data/2.5/onecall?lat=33.44&lon=-94.04&appid=f6c40e0c3e23e9c2a1816b8b695f5b3e"
        
        Session.default.request(urlS).responseDecodable(of: WeatherData.self) { response in
            //completion handler
            print("Executed on main? \(Thread.isMainThread)")
            
            
            switch response.result {
            case .success(let weather):
                print("Got data successfully : \(weather)")
                handler(weather)
            case .failure(let err):
                print("ERROR : \(err.localizedDescription)")
            }
            
            
        }
        
            
        }
        
    
}

struct WeatherData : Codable{
    
    var lat : Double
    var long : Double
    var timezone : String
    var current : Current
    var minutely : [Minutely]
    var hourly : [Hourly]
    var daily : [Daily]
}

struct Current : Codable{
    
    var dt : Double
    var sunrise : Double
    var sunset : Double
    var temp : Double
    var weather : [Weather]
}

struct Weather : Codable{
    
    var id : Int
    var main : String
    var description : String
    var icon : String
}
struct Minutely : Codable{
    
    var dt : Double
    var precipitation : Int
}
struct Hourly : Codable{
    var dt : Double
    var temp : Double
    var humidity : Double
    var clouds : Bool
    var weather : [Weather]
    var pop : Bool
}
struct Daily : Codable{
    
    var dt : Double
    var sunrise : Double
    var sunset : Double
    var moonrise : Double
    var moonset : Double
    var temp : [Temp]
}

struct Temp: Codable{
    var day : Double
    var min : Double
    var max : Double
    var night : Double
    var morn : Double
}
