//String Operation
var message = "Hello! How are you?"
//total character count
print("Total Characters: \(message.count)")

print("First Char: \(message[message.startIndex])")
print(" Last Char : \(message[message.index(before : message.endIndex)])")
print("Is this question : \(message.hasSuffix("?"))")

//optional caracter

//print("First Char: \(message.first)")
//print("Last Char : \(message.last)")
//this will throw warning
print("First Char: \(message.first ?? " ")")
//on both sides the data type must be the same for ni-colasing operator


//isEMpty
if(!message.isEmpty)
{
  print(message)
}

//Offset
var idx = message.index(after: message.startIndex) //e
print("Second char: \(message[idx])")

idx = message.index(message.startIndex, offsetBy: 5) //0 onwards
print(" sixth chartacter : \(message[idx])")

idx = message.index(message.endIndex, offsetBy: -4) //-1 onwards
print(" sixth chartacter : \(message[idx])")

var num = 5
print(num)
num = 6
print(num)

//range
var chRange = idx..<message.endIndex

print("Last 4 : \(message[chRange])")

//String manipulation
var upperMsg = message.uppercased()
print("\(upperMsg)")
print("\(upperMsg.lowercased())")

//append
message.append(" Y")
print("\(message)")
message.append("es I am")
print("\(message)")

//insert
message.insert("*", at: message.startIndex)
print("\(message)")

message.insert(contentsOf: "lllll", at: message.index(message.startIndex, offsetBy:5))
print("\(message)")

//removal
message.remove(at: message.startIndex)
print("\(message)")
//removing Yes I am
var subRange = message.index(message.endIndex, offsetBy:-9) ..< message.endIndex
message.removeSubrange(subRange)
print("\(message)")
//or
//message.removeLast(1)
//print("\(message)")

/*
let position = message.firstIndex(of: "?") ?? message.startIndex
print("\(message[position])")
*/
//OR

let position = message.firstIndex(of: "?")

if(position == nil)
{
  print("? is not found")
}
else
{
  print("? is found")
}

if(message.contains("?"))
{
  print("found")
}
else
{
  print("not found")
}
let words = message.split(separator: " ")
print(words)

for word in words{
  if(word == "How")
  {
    print("present")
  }
}
//var logs="line1\nline2\nlin3"
var logs="""
line1
line2
line3
"""
print(logs)

let allLines = logs.split(separator: "\n")
print("\(allLines)")

for line in allLines
{
  print(line.uppercased())
}

//reduced
//In Swift you use map(), reduce() and filter() to loop over collections like arrays and dictionaries, without using a for-loop.

//use of reduce
var numbers = [1,2,3,4]
var sum = 0
//to find sum of all the numbers in the array
for n in numbers
{
  sum = sum + n

}
print(sum)

//instead of this use reduce
let number = [1, 2, 3, 4]
let numberSum = number.reduce(0, { x, y in x + y})
print(numberSum)

