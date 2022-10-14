//
//  TmdbUtility.swift
//  MovieApp2
//
//  Created by admin on 22/09/22.
//

import Foundation
import Alamofire

//singleton
struct TmdbUtility {
    
    let tmdbAPI = "https://api.themoviedb.org/3"
    let apiKey = "e0c38a309fbffd2d929dc5abd3da200c"
    let imgPath = "https://image.tmdb.org/t/p/w500"
    static var instance = TmdbUtility()
    
    private init() {
        
        
    }
    
    func downloadImg (imgName: String, completionHandler: @escaping (Data) -> Void) {
        
        
        
        let imgUrl = "\(imgPath)\(imgName)"
        
        Session.default.download(imgUrl).responseData { response in
            switch response.result {
                
            case .success(let imgData):
                print("Image successfully downloaded.. \(imgData)")
                completionHandler(imgData)
                
            case .failure(let err):
                print("Image download failed : \(err.localizedDescription)")
            }
        }
    }
    
    //overloading downloadImg
    
    func downloadIfRequired(imageName: String) -> URL?{
        
        //check if img is available in the file, if not then download..else take available image
        let docUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        //appending path component
        let fileUrl = docUrl.appendingPathComponent(imageName)
        
        if FileManager.default.fileExists(atPath: fileUrl.path) {
            print("\(imageName) image already exits")
            return fileUrl
        }else {
            print("Image does not exist...\(imageName)... Downloading....")
            downloadImg(imgName: imageName)
            return nil
        }
        
    }
    
    func downloadImg (imgName: String) {
        
        let newImgName = imgName
        //newImgName.remove(at: newImgName.firstIndex(of: "/")! )
        
        let imgUrl = "\(imgPath)\(newImgName)"
        
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
    
    //get details of movies :
    
    func getMovieDetails(id: Int, handler: @escaping (MovieDetails)->Void) {
        
        let urls = "\(tmdbAPI)/movie/\(id)?api_key=\(apiKey)"
        
        Session.default.request(urls).responseDecodable(of: MovieDetails.self) { response in
            
            switch response.result {
                
            case .success(let movieD):
                handler(movieD)
                
            case .failure(let err):
                print("Error in calling : \(err.localizedDescription)")
            }
            
        }
        
    }
        
        
        func getTopRatedMovies(handler: @escaping ([TMDBMovie])->Void) {
            
            
            let urlS = "\(tmdbAPI)/movie/top_rated?api_key=\(apiKey)"
            
            Session.default.request(urlS).responseDecodable(of: MovieDecodable.self) { response in
                //completion handler
                print("Executed on main? \(Thread.isMainThread)")
                
                
                switch response.result {
                case .success(let movieResults):
                    //print("Got data successfully : \(movieResults)")
                    handler(movieResults.results)
                case .failure(let err):
                    print("ERROR : \(err.localizedDescription)")
                }
                
                
            }
            
            
        }
    }
    
    struct MovieDecodable : Codable {
        
        var results: [TMDBMovie] // every results is of the type TMDBMovie
        
    }
    
    //inner obj --- movie
    
    struct TMDBMovie : Codable {
        
        var adult : Bool
        var id : Int
        var overview : String //movie summary
        var poster_path : String //image
        var release_date : String
        var title : String //movie name
        var vote_average : Double //movie rating
    }
    
    //structure for movie details
    
    
    struct MovieDetails : Codable {
        
        var adult : Bool
        // var belongs_to_collection : [BelongsToCollection]
        var poster_path : String
        var budget : Int
        var genres : [Genres]
        var id : Int
        var original_language : String
        var original_title : String
        var overview : String
        var popularity : Double
        var tagline : String
        
    }
    
    struct Genres : Codable {
        
        var name : String
    }
    

