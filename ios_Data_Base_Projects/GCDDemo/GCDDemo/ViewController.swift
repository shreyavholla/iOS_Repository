//
//  ViewController.swift
//  GCDDemo
//
//  Created by admin on 21/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var statusL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //doTask()
        
        Task {
            
            await doTaskAsync()
        }
    }
    
    func doTaskAsync() async  {
        
        print("Task started by... \(mainthread())")
    
            try! await Task.sleep(nanoseconds: 2_000_000_000) //sleep is async
            print("Task Completed by ... \(mainthread())")
    }

    func doTask(){
        
        for i in 1...1000 {
            DispatchQueue.global().async {
                Thread.sleep(forTimeInterval: 2)
                print("Task # \(i) complted") //thread pool - GCD will try to reuse the thread, wont create  1L threads in async
            }
        }
    }
    
    func mainthread() -> String {
        
        var thread: String = ""
        
        if Thread.isMainThread {
            
            thread = "main thread"
        }else {
            thread = "global thread"
        }
        
        return thread
    }

    fileprivate func withGCD() {
        DispatchQueue.global().async {
            
            print("Download started by: \(self.mainthread() )")
            Thread.sleep(forTimeInterval: 5)
            print("Download Completed")
            
            DispatchQueue.main.sync {
                
                self.statusL.text = "Download Completed.."
            }
        }
    }
    
    func withOperationQue(){
        
        let opQ = OperationQueue()
        
        opQ.addOperation {
            print("Download started by: \(self.mainthread())")
            Thread.sleep(forTimeInterval: 5)
            print("Download Completed")
            
            OperationQueue.main.addOperation {
                self.statusL.text = "Download Completed"
            }
        }
        
        print("Completed...")
        //opQ.cancelAllOperations()
        
    }
    
    @IBAction func downloadClicked(_ sender: Any) {
        
        print("Download Started By : \(self.mainthread())")
        
        //ToDo ... download data
        statusL.text = "Download Started..."
        
        withOperationQue()
        
      
    }
    
    
    
    @IBAction func uploadClicked(_ sender: Any) {
        
        print("Upload Started By : \(self.mainthread())")
        statusL.text = "Upload Started..."
        DispatchQueue.global().async {
            //code for upload
            print("Upload Started By : \(self.mainthread())")
            print("Upload Completed")
            
            Thread.sleep(forTimeInterval: 10)
            
            DispatchQueue.main.sync {
                self.statusL.text = "Upload Completed..."
            }
        }
    }
}

