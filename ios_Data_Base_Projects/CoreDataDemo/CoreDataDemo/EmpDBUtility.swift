//
//  EmpDBUtility.swift
//  CoreDataDemo
//
//  Created by admin on 20/09/22.
//

import Foundation
import UIKit

//singleton pattern
struct EmpDBUtility {
    
    //instance
    static var instance = EmpDBUtility()
    
    static let cityList = ["Bangalore","Panjim","Telangana","Kochin","Mumbai","Chennai"]
    
    var dbContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
    //private constructor
   private init()
  {
        
    }
    
    func addEmployee(id: Int, name: String, city: String, salary: Float) -> Bool {
        
        //creating object of the class Employee with context
       let emp = Employee(context: dbContext)
        emp.id = Int16(id)
        emp.name = name
        emp.city = city
        emp.salary = salary
        
        //saving
        do {
            try dbContext.save()
            
            print("Added employee : \(name)")
            return true
        }catch{
            dbContext.delete(emp)
            print("Error adding employee \(name) : \(error.localizedDescription)")
            return false
        }
        
        
        
    }
    
    func getAllEmployees() -> [Employee]? {
        
        let fetchReq = Employee.fetchRequest()
        
        do {
            let empList = try dbContext.fetch(fetchReq)
            return empList
        }catch{
            print("Fetch Request failed: \(error.localizedDescription)")
            return nil
        }
       
        
    }
    
    func deleteEmp(emp: Employee) {
        
        print("Deleted Employee : \(emp.name ?? "" )")
        dbContext.delete(emp)
        
        do{
            try dbContext.save()
            
        }catch {
            
            print("Deletion failed: \(error.localizedDescription)")
        }
        
    }
    
    func sortEmpBySalary() -> [Employee]? {
        
        let fetchReq = Employee.fetchRequest()
        
        let salarySortDesc = NSSortDescriptor(key: "salary", ascending: false)
        
        fetchReq.sortDescriptors = [salarySortDesc]
        
        do {
            
            let empList = try dbContext.fetch(fetchReq)
            return empList
        }catch {
            print("Fetch Request failed: \(error.localizedDescription)")
            return nil
        }
    }
    
    func filterEmpByCity(cityName: String) -> [Employee]?{
        
        let fetchReq = Employee.fetchRequest()
        
        let salarySortDesc = NSSortDescriptor(key: "salary", ascending: false)
        
        fetchReq.sortDescriptors = [salarySortDesc]
        fetchReq.predicate = NSPredicate(format: "city = %@", cityName)
        do {
            
            let empList = try dbContext.fetch(fetchReq)
            return empList
        }catch {
            print("Fetch Request failed: \(error.localizedDescription)")
            return nil
        }
        
    }
    
    
}
