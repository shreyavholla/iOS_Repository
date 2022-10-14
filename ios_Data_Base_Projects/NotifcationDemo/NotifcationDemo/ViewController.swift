//
//  ViewController.swift
//  NotifcationDemo
//
//  Created by admin on 26/09/22.
//

import UIKit
import UserNotifications
import CoreLocation

class ViewController: UIViewController {

    
    @IBOutlet weak var infoL: UILabel!
    
    
    var isAuthorized : Bool = false
    
    var locUtility = LocationUtility()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UNUserNotificationCenter.current().delegate = self
        //method configure notification
        configureNotification()
    }

    func configureNotification() {
        
        setUpCategory()
        //1. check authorization status
        
        UNUserNotificationCenter.current().getNotificationSettings { nSettings in
            switch  nSettings.authorizationStatus {
                
            case .notDetermined :
                print("Notification not determinded...")
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { isGranted, err in
                    if isGranted {
                        
                        self.isAuthorized = true
                        print("Permission granted by user..")
                    }else {
                        
                        print("Permission DENIED by user...")
                    }
                }
            case .denied :
                print("Notification denied...")
                self.isAuthorized = false

            case .authorized :
                print("Notification authorized...")
                self.isAuthorized = true
            default:
                
                break
            }
        }
        
        //2.
    }

    @IBAction func scheduleClicked(_ sender: Any) {
        
        if isAuthorized {
            
            print("Going to schedule...")
            scheduleNotification(type: 3)
        }else {
       
            showAlert(title: "PERMISSION PROBLEM", msg: "Go to Settings -> NotificationDemo -> Modify Permissions")
            
        }
    }
    
    
    
    
    
}



extension ViewController : UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        print("Did Receive Executed")
        print("app is in background")
        //infoL.text = "Welcome to the meeting"
        
        switch response.notification.request.identifier {
            
        case "test1":
            print("timer of 10 sec elapsed")
            infoL.text = "Time Interval Notification.."
        
        case "test2":
            print("Meeting time...")
            if response.actionIdentifier == "attend"{
                
                infoL.text = "Joined meeting successfully"
                print("User joined to the meeting successfully")
            }else {
                
                print("User declined to join")
            }
            
        case "test3":
            print("user has entered or exited Synchronoss")
        
        default:
            break
            
        }
        
        
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        print("Will Present Executed")
        print("App is in foreground")
        completionHandler(.banner)
        
        switch notification.request.identifier {
            
        case "test1":
            print("timer of 10 sec elapsed")
            showAlert(title: "TIME UP", msg: "10 sec are over")
        
        case "test2":
            print("Meeting time...")
            showAlert(title: "MEETING", msg: "Welcome to the Meeting")
            
        case "test3":
            print("user has entered or exited Synchronoss")
            showAlert(title: "AT SYNCHRONOSS", msg: "Welcome to Synchronoss")
        default:
            break
            
        }
    }
    
}
