//Radius of a circle

var pi = 3.142 //double
var radius : Float = 11.2

var area = Float(pi) * radius * radius

print("Area of the circle is : \(area)")
print("Radius of the circle is :",radius)

//Min and max
print("Min number :\(UInt8.min) \nMax number : \(UInt8.max)")

//integer and UInt8, type conversion and Initializer
var num1 = 12
var num2: UInt8 = 10

var sum = UInt8(num1) + num2

print("Sum of \(num1) and \(num2) is \(sum).")

//boolean
var isEven : Bool

isEven = num1 % 2 == 0 ? true : false ; print(isEven)

//typealiases
typealias Boolean = Bool
var isNotEven : Boolean = false
if(isNotEven)
{
  print("isEven")
}
else
{
  print("isnotEvent")
}
