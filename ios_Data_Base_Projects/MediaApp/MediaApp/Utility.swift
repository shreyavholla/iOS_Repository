//
//  Utility.swift
//  MediaApp
//
//  Created by admin on 27/09/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title: String, msg: String){
        
        let alertVC = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alertVC.addAction(okAction)
        
        present(alertVC, animated: false)
    }
    
   
    
    func shareFile(fileUrl: URL) -> UIDocumentInteractionController{
        
       let vc = UIDocumentInteractionController(url: fileUrl)
        vc.uti = try! fileUrl.resourceValues(forKeys: [URLResourceKey.typeIdentifierKey]).typeIdentifier!
        return vc
    }
    
    func saveToDocumentDir(dataToSave: Data, filename: String) -> URL?
    {
        
       let docUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        let fileUrl = docUrl.appendingPathComponent(filename)
        do{
            try dataToSave.write(to: fileUrl)
            return fileUrl
        }catch{
            print("Saving failed to file \(filename)")
            return nil
        }
        
    }
}
