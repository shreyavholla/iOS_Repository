//define base/parent/super class

class Employee {
    var id: Int
    var name: String //private instance property
    private var salary: Int
    
    static var empCount = 0 //type property, common to all objects
    //static var bonus = 100
    var bonus: Int { //computed property
        100
    }
    
    func getSalary() -> Int {
        return salary
    }
    
    func setSalary(newsal: Int) {
        salary = newsal
    }
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
    }
    
    func applyBonus() //only instance methods can
    {
        salary += bonus
    }
    
    static func displayCount(){
        print("Total number of employees is : \(empCount)")
    }
}
//define derived/child/sub class
class Developer: Employee {
    var skills: String
    override var bonus: Int {
        2000
    }
    
    init( id: Int, name: String, salary: Int, skill: String){
        
        skills = skill
        super.init(id: id, name: name, salary: salary)
    }
    
    override func display(){ //method overriding
        super.display()
        print("Skills : \(self.skills)")
    }
}

class Tester: Employee {
    var tool : String
    
    init(id: Int, name: String, salary: Int, tool: String) {
        self.tool = tool
        super.init(id: id, name: name, salary: salary)
        
    }
    
    override func display() {
        super.display()
        print("Testing Tool : \(tool)")
    }
}

//object
let emp1 = Employee(id: 1, name: "John", salary: 1000)
//emp1.display()

let emp2 = Developer(id: 2, name: "Marry", salary: 2000, skill: "iOS Developer")
//emp2.display()

let emp3 = Tester(id: 3, name: "Robert", salary: 1500, tool: "Selenium")

var empList : [Employee] = [emp1, emp2, emp3]

for emp in empList
{
    emp.display() //decided at run Time -- Run Time Polymorphism
    print()
}

print("Total employees: \(Employee.empCount)")
Employee.displayCount()
