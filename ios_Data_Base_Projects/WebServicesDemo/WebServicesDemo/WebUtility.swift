//
//  WebUtility.swift
//  WebServicesDemo
//
//  Created by admin on 21/09/22.
//

import Foundation



struct Place : Codable {
    
    //json parsing
    var placeName: String
    var lat: Double?
    var lng: Double?
    var adminName2: String? //city name
    var adminName1: String? //state name
    var countryCode: String
}

//outer structure
struct PlaceList : Codable {
    
    var postalCodes: [Place]
}


//singleton
//static instance
//private init
struct WebUtility {
    
    static var instance = WebUtility()
    
    private init(){
        
    }
    
    func getPlaces(postalCode: String, completionHandler: @escaping (PlaceList)->Void) {
        
        //webservice communication
        
        let urlS = "http://api.geonames.org/postalCodeSearchJSON?postalcode=\(postalCode)&maxRows=10&username=ShreyaHolla"
        guard let url = URL(string: urlS) else{
            
            print("URL is invalid")
            
            return
        }//string converted to url
        
        //1. URLSession
        
        let session = URLSession.shared
        
        //2. URLRequest
        
        
        
        //3. URLSessionTask
        
        let task = session.dataTask(with: url) { respData, respObj, err in
            
            //check for error -- nil if successful
            print("Executed by :\(Thread.isMainThread)")
            guard err == nil else {
                print("Some Network Issue... \(err!.localizedDescription)")
                return
            }
            
            //no errors
            //check for response object
            guard let respObj = respObj as? HTTPURLResponse else{
                
                print("Resonse not available")
                return
            }
            
            print("Status code: \(respObj.statusCode)\n\(respObj.description)") //downcasting
            
            
            switch respObj.statusCode {
                
            case 200 :
                if let dataparsed = parseResonse(respData){
                    completionHandler(dataparsed)
                }
                
            case 400..<500:
                print("Client Side Problem - Something wrong with request: \(respObj.description)")
            case 500..<600:
                print("Server Error")
            default :
                break
            }
        }
        
        task.resume() //fires the request, starts the task
        print("Request is fired")
        
        
    }
   
    
    func parseResonse(_ receivedData: Data?) -> PlaceList? {
        
        
        guard let receivedData = receivedData else {
            
            print("No data from server")
            return nil
        }
        do{
            let placeList = try JSONDecoder().decode(PlaceList.self, from: receivedData)
            return placeList
        }catch{
            print("Decoding failed: \(error.localizedDescription)")
            return nil
        }
        
    }
    


    func getPlaces(postalCode: String) async throws -> PlaceList {
        
        //webservice communication
        
        let urlS = "http://api.geonames.org/postalCodeSearchJSON?postalcode=\(postalCode)&maxRows=10&username=ShreyaHolla"
        guard let url = URL(string: urlS) else{
            
            print("URL is invalid")
            throw HTTPError.invalidURL
            // return
        }//string converted to url
        //1. URLSession
        let session = URLSession.shared
        //3. URLSessionTask
        
        let (respData, resp) = try await session.data(from: url)
        
        let respObj = resp as! HTTPURLResponse
        
        
        print("Status code: \(respObj.statusCode)\n\(respObj.description)") //downcasting
        
        
        switch respObj.statusCode {
            
        case 200 :
            if let dataparsed = parseResonse(respData){
                return dataparsed
            }else {
                throw HTTPError.decodingError
            }
            
        case 400..<500:
            print("Client Side Problem - Something wrong with request: \(respObj.description)")
            throw HTTPError.invalidRequest
        case 500..<600:
            print("Server Error : \(respObj.description)")
            throw HTTPError.internalServerError
        default :
            throw HTTPError.unknownError
            
        }
    }
}


enum HTTPError : Error {
    case invalidURL
    case invalidRequest
    case internalServerError
    case unknownError
    case decodingError
}



