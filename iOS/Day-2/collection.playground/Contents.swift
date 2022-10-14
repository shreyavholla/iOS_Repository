//COLLECTION TYPES

// - arrays : ordered (cannot have duplicates)
// - sets : unordered collection of unique values
// - dictonaries : unordered, key-value pairs

// - tuple : is not a collection type

//ARRAYS
// - stores values of the same type in an ordered list.
// - same value can appear in an array multiple times at different positions

// - let : continious memory allocations
//   - saves memory

// - var : not continious
//   - data will be stored in different locations
//   - but their references will be stored in the array in an ordered format

// - Syntax:
//   a) var data = Array<Int>()
//       data.append(1)
//   b) let data = [1,2,3,4]
//   c) var data = [Int]()
//   d) var data:[Character] = ["a","b","c","d"]

// - Initializers in an array:
//   - var threeDoubles = Array(repeating:0.0, count:3)

//array is a structure
var data = Array<Int>()

//insertion
data.append(1)
data.append(20)
data += [100]
data.insert(15, at:2) //0-1-2

print(data)

//traversal
let names = ["John", "Marry", "Robert"]
for name in names{
  print("Name : \(name.uppercased())")
}

print()
for (index,value) in names.enumerated()
{
  print("\(index+1). \(value)")
}
//reversal
print()
let revsName:[String] = names.reversed()
print(revsName)

//removal
print()
data.removeSubrange(1...2) //starts from 0
print(data)

//updation
print()
data[0] = 2
print("Updated Data = \(data)")
//data[1...3] = [200, 17, 300] //array index is out of range
data[0...1] = [6, 4, 300, 1]
print("Updated Data = \(data)")

//other things
print(names.isEmpty)
print(names.count)
print()
var items:[Any] = ["Tea", 5, true] //heterogeneous collection

for item in items{

  // if item is Int{
  //   print(item)
  // }

  switch item{
    case is Int:
      print("Number is \(item)")
    case is String:
      print("String is \(item)")
      print("In uppercase: \("\(item)".uppercased())")
      //use string interpolation
    case is Bool:
      print("Boolean value is \(item)")
    default:
      print("None")
  }
}

//SET
//  - create an empty set of a certain type using intializer syntax
// - initialize a set with an array literal
// - cant add duplicated value
// - you can iterate but cant index
var letters = Set<Character>()
var favGames: Set = ["Rock","Class","Hard"]
var c = letters.count
// - can also use removeAll()
// - method.contains()

// - sorted() method

//SET OPERATIONS on 2 diff sets a and b
// - a.union(b)
// - a.intersection(b)
// - a.symmetricDifference(b)
// - a.subtracting(b)

// - you can convert an array to a set to remove duplicated values


var evenNos: Set<Int> = [0,2,4,6,8] //or
let oddNos: Set = [1,3,5,7,9] //cannot insert
let primeNos: Set = [2,3,5,7]
print(evenNos) // 0,2,8,4,6
print(oddNos) //1,3,7,9,5

//insertion
//has no append method
evenNos.insert(10)
evenNos.insert(10) //duplicate values are ignored
print(evenNos)

let allNum = evenNos.union(oddNos).sorted()
print(allNum)

let commonNum = evenNos.intersection(oddNos).sorted()
print(commonNum)

print("Symmetric DIff : \(evenNos.symmetricDifference(primeNos).sorted())")

print("Subtracting : \(evenNos.subtracting(primeNos).sorted())")

//CONVERTING ARRAY TO SET

let numbers = [1,2,3,1,2,3]
let uniqNos = Set(numbers)
print("Unique Numbers are : \(uniqNos)")

//DICTIONARY
// - Dictionary<Key,Value>
// - [Key:Value] //shorthand
// - creating an empty dictionary
// - var namesOfIntegers = [Int:String]()
//   or namesOfIntegers = [:]
// - namesOfIntegers[6] = "six"

// - var airports : [String:String] = ["A":"Dublin","Toronto":"Babylon"]

// -unordered collection dont have append

// //removing
// Airport["APL"]=nil
// Aiprort.removeValue(forKey:"APL")

// for airportCode in airport.keys
// for airportCode in airport.values
// let airportCodes = [String](airport.keys)

//WORKSHOP
print("\n\n\n\n")
var contacts: Dictionary<String,Int> = [:]

contacts["John"]=123
contacts["Marry"]=456
contacts["Albert"]=789
contacts["Rose"]=91011
print(contacts)

contacts["John"]=111
print(contacts)
print()
print("John's Phone number is : \(contacts["John"] ?? 0)")
//iterating over dictionary

print()
for(name,number) in contacts{
  print("\(name)'s number : \(number)")
}

print("ALL Names")
for name in contacts.keys{
  print(name)
}

print("ALL contacts")
for phone in contacts.values{
  print(phone)
}

//removal
print()
contacts["John"]=nil
print(contacts)

print()
contacts.removeValue(forKey:"Marry")
print(contacts)

print()
contacts.removeAll()
print(contacts)

var officeContacts = ["mike":555, "tom":666, "jerry":777]

print("Office: \(officeContacts)")

officeContacts.merge(contacts){(current, _) in current}

/*
Assignment

Aadhar records in a dictionary

per record
  -name
  -mobile number
  -aadhar no (key)
  -city

Dictionary<String,[String]> ----option1

Dictionary<String, Dictionary<String,String> > ---option 2

Dictionary<String, (name: String,mobile: String,city: String)> --- option 3

dict = ["111": ["name":"John", "Mobile":"1123", "city":"Bangalore"]]

dict["111":["name"]]="John"
//given aadhar number print all details
//given city print all details

*/

print("\n\n\n")
var AadharRecords: Dictionary<String, Dictionary<String,String>> = [:]

AadharRecords["101"]=["name":"John","mobile":"123","city":"Bangalore"]

AadharRecords["102"]=["name":"Marry","mobile":"456","city":"Delhi"]

AadharRecords["103"]=["name":"Tim","mobile":"789","city":"Bangalore"]

AadharRecords["104"]=["name":"Bob","mobile":"1011","city":"Bangalore"]
print(AadharRecords)


/*Assignment

- print all prime numbers between 1 to 20
