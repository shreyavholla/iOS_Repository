//
//  Utility.swift
//  NotifcationDemo
//
//  Created by admin on 26/09/22.
//

import Foundation
import UIKit
import CoreLocation

extension UIViewController {
    
    func showAlert(title: String, msg: String){
        
        let alertVC = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        let okAlert = UIAlertAction(title: "OK", style: .default)
        
        alertVC.addAction(okAlert)
        
        present(alertVC, animated: false)
    }
    

    func setUpCategory()
    {
        //adding buttons -- creating categories
        let ACTION_ATTEND = UNNotificationAction(identifier: "attend", title: "Attend")
        let ACTION_LEAVE = UNNotificationAction(identifier: "leave", title: "Leave")
        let meetingCategory = UNNotificationCategory(identifier: "JoinMeeting", actions: [ACTION_ATTEND, ACTION_LEAVE], intentIdentifiers: [])
        
        
        UNUserNotificationCenter.current().setNotificationCategories([meetingCategory])
    }
    func scheduleNotificationWithCalender(){
        
        let content = UNMutableNotificationContent()
        
        content.title = "WEEKLY SPRINT MEETING"
        content.body = """
         HURRY UP AND JOIN..
        """
        content.subtitle = "DON'T BE LATE"
        content.sound = .defaultRingtone
        content.badge = 1
        content.categoryIdentifier = "JoinMeeting"
        
        // 2. create the trigger
        
        var meetingTime = DateComponents()
        meetingTime.calendar = Calendar.current
        meetingTime.weekday = 2
        meetingTime.hour = 12
        meetingTime.minute = 42
        meetingTime.second = 40
        
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: meetingTime, repeats: true)
        
        // 3. create and register the request
        
        let request = UNNotificationRequest(identifier: "test2", content: content, trigger: trigger)
        
        // 3b) registering the request
        UNUserNotificationCenter.current().add(request)
        print("Timer Notifcation Set for \(meetingTime.date!)")
        
    }
    func scheduleNotificationWithLocation(){
        
        let content = UNMutableNotificationContent()
        
        content.title = "Welcome to Synchronoss Technlogies India Pvt Ltd"
        content.body = "Lets Get Going..."
        content.subtitle = "This is the subtitle"
        content.sound = .defaultRingtone
        content.badge = 1
        
        // 2. create the trigger
        let center = CLLocationCoordinate2D(latitude: 77.60188868379707, longitude: 12.92423729365042)
        let region = CLCircularRegion(center: center, radius: 2000.0, identifier: "Synchronoss")
        
        region.notifyOnEntry = true
        region.notifyOnExit = true
        
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        
        // 3. create and register the request
        
        let request = UNNotificationRequest(identifier: "test3", content: content, trigger: trigger)
        
        // 3b) registering the request
        UNUserNotificationCenter.current().add(request)
        print("Location notification set  To Synchronoss")
    }
    
    
    
        func scheduleNotification(type: Int = 1) {
            
            //1 - for time interval
            //2 - for calender based
            //3 - for location
            
            switch type {
                
            case 1:
                scheduleNotificationWithTimeInterval()
                break
            case 2:
                scheduleNotificationWithCalender()
                
            case 3:
                scheduleNotificationWithLocation()
                break
            default:
                break
            }
            
        }
        
        func scheduleNotificationWithTimeInterval(){
            
            // 1. create content of the notification
            
            let content = UNMutableNotificationContent()
            
            content.title = "TIME UP (10 SEC OVER)"
            content.body = """
            ** This is the body **
            Your 10 sec are over
            """
            content.subtitle = "This is the subtitle"
            content.sound = .defaultRingtone
            content.badge = 1
            
            // 2. create the trigger
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            
            // 3. create and register the request
            
            let request = UNNotificationRequest(identifier: "test1", content: content, trigger: trigger)
            
            // 3b) registering the request
            UNUserNotificationCenter.current().add(request)
            print("Timer Notifcation Set for 10 sec...")
        }
    

}

