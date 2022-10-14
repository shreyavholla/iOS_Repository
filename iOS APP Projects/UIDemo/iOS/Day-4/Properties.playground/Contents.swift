struct Person {
    
    //Stored Properties
    var firstName: String
    var lastName: String
    var age: Int
    
    //Computed Property -- has to be var
    var fullName: String {
        get {
            print("Computing Full Name")
            return "\(firstName) \(lastName)"
        }
        //setter is not mandatory
        set(newFN){
            print("Setting full name to \(newFN)")
            let splits = newFN.split(separator: " ")
            firstName = "\(splits[0])"
            lastName = "\(splits[1])"
        }
    }
}

var p1 = Person(firstName: "John", lastName: "Smith", age: 20)

print(p1.fullName)

p1.fullName = "Merry Rose" //able to modify the same variable using computer property : get and set
print(p1)

struct University {
    var name: String
    var website: String
    var city: String
}


struct Student {
    
    //unused initializer
    //are usage optimization
    lazy var institute = University(name: "IIT Roorkee", website: "www.iitb.in", city: "Roorkee")
    var name: String
    var rollNo: Int
    var marks: Int
    static let outOf = 800
    
    var percentage: Double {
        //READ ONLY COMPUTED PROPERTY
//        get{
//            return Double(marks) / Double(Student.outOf) * 100
//        }
        
        //OR
        Double(marks) / Double(Student.outOf) * 100
        
    }
}

var std1 = Student(name: "Anna", rollNo: 1, marks: 780)
print(std1)
//without lazy it will print --- Student(institute: __lldb_expr_73.University(name: "IIT Roorkee", website: "www.iitb.in", city: "Roorkee"), name: "Anna", rollNo: 1, marks: 780)
print(std1.percentage)
print(std1.institute)


