class Employee {
    var id: Int
    var name: String //private instance property
    var salary: Int
    static var empCount = 0 //type property, common to all objects
    
    init(id: Int, name: String, salary: Int){
        self.id = id
        self.name = name
        self.salary = salary
        print("Init of Employee Class\n")
        
        Employee.empCount += 1
    }
    
    func display() {
        print("Id : \(self.id)")
        print("Name : \(name)")
        print("Salary : \(self.salary)")
        print("City : \(self.city)")
    }
    
    static func displayCount(){
        print("Total number of employees is : \(empCount)")
    }
}

let emp1 = Employee(id: 1, name: "john", salary: 1000)
emp1.display()
emp1.applyBonus(bonus: 1000)

//extension to a class
extension Employee{
    
    var city: String {
        
        switch id {
            
        case 1...100:
            return "Bangalore"
            
        case 100...200:
            return "Pune"
        
        default:
            return "Mumbai"
        }
    }
    
    func applyBonus(bonus: Int){
        self.salary += bonus
    }
    
    
}

emp1.applyBonus(bonus: 1000)
emp1.display()




//extension to a structure
extension String {
    
    mutating func removeFirstAndLast() {
        self.removeFirst()
        self.removeLast()
    }
}

var name = "Synchronoss"
name.removeFirstAndLast()
print("Updated name is : \(name)")

