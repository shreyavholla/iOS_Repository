//
//  ReminderDBUtility.swift
//  RemindMe
//
//  Created by admin on 23/09/22.
//

import Foundation
import UIKit

//singleton and init
struct ReminderDBUtility{
    
    static var instance = ReminderDBUtility()
    
    var alert : UIViewController?
    
    var dbContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private init() {
        
        
    }

    func addReminder(title: String, desc: String, date: String, time: String) -> Bool{
        
        //object of class Reminder with context
        let reminder = ReminderData(context: dbContext)
        reminder.title = title
        reminder.date = date
        reminder.desc = desc
        reminder.time = time
        //saving the data into the db
        do{
            try dbContext.save()
            print("New Reminder Added : \(title)")
          
            return true
        }catch{
            dbContext.delete(reminder)
            print("ERROR inserting DB : \(error.localizedDescription)")
            return false
            
        }
        
    }
    
    func fetchReminders() -> [ReminderData]?{
        
        let sortByDate = NSSortDescriptor(key: "date", ascending: true)
        let sortByTime = NSSortDescriptor(key: "time", ascending: true)
        let fetchData = ReminderData.fetchRequest()
        fetchData.sortDescriptors = [sortByDate,sortByTime]
        
        do{
            let reminders = try  dbContext.fetch(fetchData)
            return reminders
        }catch {
            print("Failed To Fetch Data. \(error.localizedDescription)")
            return nil
        }
        
        
    }
    
    func deleteReminder(rem: ReminderData){
        print("Deleted reminder successfully : \(rem.title ?? "" )")
        dbContext.delete(rem)
        
        do{
            try dbContext.save()
        }catch{
            print("Deletion Failed : \(error.localizedDescription)")
        }
        
    }
    
    
    
}
