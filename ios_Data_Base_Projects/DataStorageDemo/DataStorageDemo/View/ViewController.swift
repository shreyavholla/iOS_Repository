//
//  ViewController.swift
//  DataStorageDemo
//
//  Created by admin on 19/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataL: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //serverpath
        if let serverUrl = getServerPath() {
            
            print("Server url :\(serverUrl)")
        }
        
        if let waitTime = getWaitTime(){
            
            print("Wait Time : \(waitTime)")
        }
        
        //dataL.text = FileStorage.defaultText.readFromFile(filename: "license.txt")
        if (FileStorage.defaultText.isFileExists(filename: "license.txt"))
        {
            dataL.text = FileStorage.defaultText.readFromFile(filename: "license.txt")
        }else{
            dataL.text = FileStorage.defaultText.readFromBundle(filename: "data", ext: "text")
        }
    }

    @IBAction func saveClicked(_ sender: Any) {
        
        let data = dataL.text ?? ""
        
        //write to file
        print("Data to be saved: \(data)")
        //write to file
        FileStorage.defaultText.writeToFile(filename: "license.txt", data: data)
    }
    
}

