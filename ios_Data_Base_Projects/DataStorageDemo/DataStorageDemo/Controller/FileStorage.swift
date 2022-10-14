//
//  FileStorage.swift
//  DataStorageDemo
//
//  Created by admin on 19/09/22.
//

import Foundation

//singleton pattern
struct FileStorage {
    
    static var defaultText = FileStorage()
    
    //file manager
    let fManager = FileManager.default //dont instanciate file manager class
    
    private init(){
        
    }
    
    func writeToFile(filename: String, data: String) {
        
       let docUrl = fManager.urls(for: .documentDirectory, in: .userDomainMask)[0] //return type is an array
        print("Writing in  dir: \(docUrl.path)")
        print("Writing in  dir: \(docUrl.absoluteURL)") //holds the scheme
        
       let fileUrl = docUrl.appendingPathComponent(filename)
    
        do {
            try data.write(to: fileUrl, atomically: true, encoding: .utf8)
            //writing the data to the url in utf8 encoding format
            print("Data Saved...")
        }catch {
            print("Writing to file: \(fileUrl) failed")
        }
        }
    
    func readFromFile(filename: String) -> String? {
        
        let docUrl = fManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileUrl = docUrl.appendingPathComponent(filename)
        print("Reading from dir: \(fileUrl.path)")
        
        
        do {
            let contents = try String(contentsOf: fileUrl)
           return contents
        }catch {
            print("Reading failed: \(error.localizedDescription)")
        }
        
       
        return nil
    }
    
    func readFromBundle(filename: String, ext: String) -> String? {
        
        guard let url = Bundle.main.url(forResource: filename, withExtension: ext) else {
            print("Resource \(filename).\(ext) not found.")
            return nil
            
        }
        
       return try! String(contentsOf: url)
    }
    
    func isFileExists(filename: String) -> Bool {
        let docUrl = fManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileUrl = docUrl.appendingPathComponent(filename)
        
        return fManager.fileExists(atPath: fileUrl.path)
        
    }
}

