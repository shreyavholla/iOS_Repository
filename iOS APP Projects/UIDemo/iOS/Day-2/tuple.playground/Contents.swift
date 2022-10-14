// //TUPLE

// - used to return multiple values in a Function
// - immutable

// -Decomposing a Tuple
// let https200Status = (statusCode:200, description:"OK")
// print("\(https200Status.statusCode)")
// or
// print("\(https200Status.0)")
// print("\(https200Status.1)")

// - Tuples in Switch

// let somePoint = (1,1)
// switch somePoint{
//   case (0,0):
//     print("\(somePoint)")
//   case (_,0):
//     print("\(somePoint)")
//   case (-2...2,-2...2):
//     print("\(somePoint)")
//   default:
//     print("\(somePoint)")
// }

// - Value Binding
// A switch case can name the value it matches to temporary constants or variables

// - can also use a where clause with value binding

//Workshop
let std = ("john", 1, 89) //tuple

//decomposing
let (name, usn, marks) = std
print("name: \(name)")
print("usn: \(usn)")
print("marks: \(marks)")
print()
//OR
print("name: \(std.0)")
print("usn: \(std.1)")
print("marks: \(std.2)")

let person = (name: "john", city: "Delhi", mobile: 111)
print(person)
print(person.name)
print(person.1)

//tuple in switch

//array of tuple
typealias Student = (name: String, usn: Int, marks: Int)
let students: [Student] = [("john", 1,70), ("marry", 2, -78),("rose", 3, 29)]

for x in students{
  // print("Name : \(x.name)")
  // print("USN : \(x.usn)")
  // print("Marks : \(x.marks)")

  switch x {
    case (_, _, 75...100) :
      print("\(x.name) student bearing usn \(x.usn) passed with distinction")
    default:
      break
  }

  switch x {
    case (_, _, let marks) where marks < 0:
      print("Invalid Marks")
    case (let stdname, _, 75...100) :
       print("\(stdname) student bearing usn \(x.usn) passed with distinction ******")
    case (let stdname, let rNo, let marks) where marks > 20 :
    print("roll no: \(rNo) \(stdname) student passes")

  default:
      break
  }
}
