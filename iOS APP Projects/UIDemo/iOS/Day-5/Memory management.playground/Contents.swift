 
class University{
    var name: String
    /*weak*/ var topper: Student?
    
    init(name: String){
        self.name = name
        print("Univ Initialized")
    }
    deinit {
        print("Univ \(name) is deallocated")
    }
}

class Student{
    
    var name: String
    var marks: Int
    /*unowned*/ var institute: University?
    init(name: String, marks: Int){
        self.name = name
        self.marks = marks
        print("\(name) object is initialized")
    }
    deinit {
        print("\(name) is deallocated")
    }
}

var std1 : Student? = Student(name: "john", marks: 10)

var univ : University? = University(name:"SVIT")

//creating strong references
std1?.institute  = univ
univ?.topper = std1 //ARC = 2

std1 = nil
univ = nil

//var std2 = std1
//var std3 = std1 //ARC = 3

//std1 = nil //ARC = 2
//std2 = nil //ARC = 1
//std3 = nil //ARC = 0, deinit will be executed now


//breaking strong references

//Student has a shorter life span than University
//- either make topper in University as weak
//- or make institute in Student as unowned
