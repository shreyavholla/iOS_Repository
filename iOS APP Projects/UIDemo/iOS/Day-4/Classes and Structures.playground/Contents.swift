//class - reference types

class Student{
    
    //properties - data encapsulation
    var name : String
    var rollNo : Int
    var marks : Int
    
    //Intiliazer
    init(name: String, rollNo: Int, marks: Int){
        //initializing all the properties
        print("inside init\n")
        self.name = name
        self.rollNo = rollNo
        self.marks = marks
    }
    
    deinit {
        //executed when object is removed from memory by ARC
        //free the resources, clan-up
        print("inside deinit")
        print("\(name) object getting deallocated")
    }
    //methods
    func displayInfo(){ //is an instance method
        print("Name: \(name)")
        print("Roll No: \(rollNo)")
        print("Marks: \(marks)")
        print()
    }
}

// all objects have a reference counter, as soon as you instanciate a class object
let std1 = Student(name:"Roberta", rollNo: 231, marks: 150) //Student() - initializer //ref count = 1
var std2: Student? = Student(name:"Tinkle", rollNo: 23, marks: 50)


let std3 = std1 //no copy, but a reference //ref count = 2
std3.marks = 100 //Roberta's marks get updated
//std1.name = "John"
//std1.marks = 89
//std1.rollNo = 1

std1.displayInfo()
std2?.displayInfo() //optional chaining

if std3 === std1{
    print("Both references same object")
} else{
    print("References different object")
}

std2 = nil //removing std2 reference -- ARC

//structure - value types

struct Person{
    
    var name = ""
    var age = 0
}

var p1 = Person()
let p2 = Person(name:"Anna", age:25) //memberwise initializer
print(p1)
print(p2)

p1.age = 30 //Cannot assign to property: 'p1' is a 'let' constant
//p2.age = 30 //Cannot assign to property: 'p2' is a 'let' constant --- cz its value type, but this can be done in class

//no counter mainted in structure

var p3 = p1
p3.age = 50

print("p1 age : \(p1.age)")
print("p2 age : \(p2.age)")
print("p3 age : \(p3.age)")




//ARC
//ARC in Action
//
//Here’s an example of how Automatic Reference Counting works. This example starts with a simple class called Person, which defines a stored constant property called name:
//
//class Person {
//    let name: String
//
//    init(name: String) {
//        self.name = name
//        print("\(name) is being initialized")
//    }
//
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//The Person class has an initializer that sets the instance’s name property and prints a message to indicate that initialization is underway. The Person class also has a deinitializer that prints a message when an instance of the class is deallocated.
//
//The next code snippet defines three variables of type Person?, which are used to set up multiple references to a new Person instance in subsequent code snippets. Because these variables are of an optional type (Person?, not Person), they are automatically initialized with a value of nil, and do not currently reference a Person instance.
//
//var reference1: Person?
//var reference2: Person?
//var reference3: Person?
//You can now create a new Person instance and assign it to one of these three variables:
//
//reference1 = Person(name: "John Appleseed")
//// Prints "John Appleseed is being initialized"
//Note that the message "John Appleseed is being initialized" is printed at the point that you call the Person class’s initializer. This confirms that initialization has taken place.
//
//Because the new Person instance has been assigned to the reference1 variable, there is now a strong reference from reference1 to the new Person instance. Because there is at least one strong reference, ARC makes sure that this Person is kept in memory and is not deallocated.
//
//If you assign the same Person instance to two more variables, two more strong references to that instance are established:
//
//reference2 = reference1
//reference3 = reference1
//There are now three strong references to this single Person instance.
//
//If you break two of these strong references (including the original reference) by assigning nil to two of the variables, a single strong reference remains, and the Person instance is not deallocated:
//
//reference1 = nil
//reference2 = nil
//ARC does not deallocate the Person instance until the third and final strong reference is broken, at which point it’s clear that you are no longer using the Person instance:
//
//reference3 = nil
//// Prints "John Appleseed is being deinitialized"




//Deinitializers are called automatically, just before instance deallocation takes place. You are not allowed to call a deinitializer yourself.
//
//You should set that instance to nil in order to destroy that instance provided that all references to that instance are broken .


//INHERITANCE - only in classes
  
