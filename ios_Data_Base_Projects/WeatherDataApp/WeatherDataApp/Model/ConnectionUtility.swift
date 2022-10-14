//
//  ConnectionUtility.swift
//  WeatherDataApp
//
//  Created by admin on 27/09/22.
//

import Foundation
import Alamofire

//singleton and private

struct ConnectionUtility {
    
    let apiKey = "f6c40e0c3e23e9c2a1816b8b695f5b3e"
    let weathUrl = "https://api.openweathermap.org/data/2.5/onecall?"
    let imgPath = "https://openweathermap.org/img/wn/"
    var lat : Double = 33.44
    var long : Double = -94.04
   
    let currentLocation = CurrentLocationUtility()
    
    static var instance = ConnectionUtility()
    
    private init(){
        
    }
    
    func getWeatherData(handler : @escaping (WeatherData)-> Void){
        
        
        let urlS = "\(weathUrl)lat=\(lat)&lon=\(long)&appid=\(apiKey)"
        
        Session.default.request(urlS).responseDecodable(of: WeatherData.self) { response in
            //completion handler
            //print("Executed on main? \(Thread.isMainThread)")
            
            
            switch response.result {
            case .success(let weather):
                handler(weather)
            case .failure(let err):
                print("ERROR : \(err)")
            }
            
            
        }
        
            
        }
    
    func getDailyData(handler : @escaping ([Daily])-> Void){
        
       let urlS = "\(weathUrl)lat=\(lat)&lon=\(long)&appid=\(apiKey)"
        
        Session.default.request(urlS).responseDecodable(of: WeatherData.self ) { response in
            
            
            switch response.result {
                
            case .success(let wdata):
                handler(wdata.daily)
            
            case .failure(let err):
                print("ERROR : \(err.localizedDescription)")
            }
        }
        
    }
        
    func getHourlyData(handler : @escaping ([Hourly])-> Void){
       let urlS = "\(weathUrl)lat=\(lat)&lon=\(long)&appid=\(apiKey)"
        Session.default.request(urlS).responseDecodable(of: WeatherData.self ) { response in
            
            
            
            switch response.result {
                
            case .success(let hdata):
                handler(hdata.hourly)
            
            case .failure(let err):
                print("ERROR : \(err.localizedDescription)")
            }
        }
    }
    
    
    func downloadImg (imgName: String) {
        
        let newImgName = imgName
        //newImgName.remove(at: newImgName.firstIndex(of: "/")! )
        
        let imgUrl = "\(imgPath)\(newImgName)@2x.png"
        
        let dest : DownloadRequest.Destination = { _,_ in
            
            let docUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            
            //appending path component
            let fileUrl = docUrl.appendingPathComponent(newImgName)
            
            return (destinationURL : fileUrl, options: DownloadRequest.Options.removePreviousFile)
        }
        
        Session.default.download(imgUrl, to : dest ).response { resp in
            switch resp.result {
                
            case .success(let imgData) :
                print("Image successfully downloaded.. \(imgData?.absoluteString ?? "")")
                
            case .failure(let err) :
                print("Image download failed : \(err.localizedDescription)")
            }
        }
    }
    
    func downloadIfRequired(imageName: String) -> URL?{
        
        //check if img is available in the file, if not then download..else take available image
        let docUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        //appending path component
        let fileUrl = docUrl.appendingPathComponent(imageName)
        
        if FileManager.default.fileExists(atPath: fileUrl.path) {
           // print("\(imageName) image already exits")
            return fileUrl
        }else {
           // print("Image does not exist...\(imageName)... Downloading....")
            downloadImg(imgName: imageName)
            return nil
        }
        
    }
}
