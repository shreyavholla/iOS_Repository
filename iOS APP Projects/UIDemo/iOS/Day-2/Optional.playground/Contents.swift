//OPTIONAL

var name = "John" //non-optional
var city:String? //optional defaulted to nil

print(name)
//print(city) : will give warning
city = "Pune"
//1. force unwrapping
if(city != nil){ //explicit check for nil
print("City: \(city!)") //forefull unwrapping
}
else
{
  print("City is nil")
}
//2.optional binding : if let or guard let
city = nil
if let myCity = city {
  print("My city: \(myCity)")
}
else{
  print("My City is nil")
}

//cannot access myCity outside the if block, but guard let has wider scope

//3.nil-colasing operator

//city = "Delhi" -----uncomment it every time to change the output
let myCity = city ?? "Goa"
print(myCity)

//Optional Chaining : use ?. with any of the above methods to avoid error

if let uCity = city?.uppercased(){
  print(uCity)
}

let num = city?.first?.asciiValue
print("Ascii value of first char: \(num ?? 0)")

var data = ["john", "bob", nil]
print(data)

for name in data{
  guard let n = name else{
    print("name is nill")
    continue
  }
  print("\(n) is the name")
}
var data = [1,2,3,nil] //array of optional integers

var numbers : [Int]? = [1,2,3,4] //optional array of integers
//numbers=nil
print("\(numbers?[0] ?? 0)")

var number : [Int?]? = [nil,1,2,] //array and integer both are optional
