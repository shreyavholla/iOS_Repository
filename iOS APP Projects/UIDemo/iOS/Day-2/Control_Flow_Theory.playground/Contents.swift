print("Control Flow")
//Conditional Statemens : if and switch
//if
var tempFar = 30
if(tempFar <= 32)
{
print ("its cold")
  //if statement needs paranthesis by default
}
else if (tempFar >= 80)
{
  print("its hot")
  //else is not mandatory
}
else
{
  print("its neutral")
}
//switch staement
/*
- when you have multiple conditions, use switch
- alternative to if statement
- does not need a break statement
- has a default
- also works with character => case "a":
- the body of each case must contain at least one executable statement, no empty body. (else Compile Time Error)

*/
switch tempFar {
  case 1:
    print("case 1")
  case 2:
    print("case 2")
  case 30,4: //compound case
    print("case 3 or 4")
  default:
    print("default")
    
}
//Interval Matching using switch
/*
case 0:
  c = "no"
case 1..<5:
  c = "few"
case 5...10:
  c = "many"
 
//while : will perform a set of statements until a condition becomes false
var square = 0
var diceRoll = 0
while(square < diceRoll)
{
  
}
 */
//repeat-while : will execute aleast once
//if
//guard :
//switch
//break and continue
//for - in loop (iterates over dictionaries,strings,etc)
/*

let names = ["Anna","Bob","Harry"]
for name in names
  print("\(index) - \(name)")

for _ in 1...5 //since i is not used put an underscore
{
  print("Hello World")
}
*/
//control transfer statements
/*
- they change the order in which the code is executed
- they transfer the control from one piece of code to another

-continue : used in for-in or while
  - will tell a loop to stop what it is doin and start again at the beginning of the next iteration through the loop
- eg. ommitin vowels of a string

-break : also used in for-in or while
  - ends execution of an entire control flow

-fallthrough :
  - used in switch
  - to showcase C behaviour, to continue the next case if break is not provided
  - will execute only i+1th case, if you want more then add another fallthrough

- gaurd : early exit statement
  - guarding a code against one statement
  - used within a function
  - used in place of if
  - for guard else is mandatory

    guard x>0 else{
        -negative no logic
    }

    - positive no logic
- return :
  
- throw
*/

//while
var counter : UInt8 = 0
while ( counter <= 5)
{
  print("Hello : \(counter)")
  counter+=1
}

print()
//repeat while
repeat{
  print("Hello : \(counter)")
  counter-=1
  
}while(counter > 0)

print()
//for in loop
let names = ["John","Alice","Bob"] //array

for name in names
{
  print("Name : \(name.uppercased())")
}

print()

let address = "Synchronoss Bangalore"
var vowelCount = 0
var alphaCount = 0
var spaceCount = 0
var specialCount = 0
for ch in address{

  switch ch.lowercased(){
    case " ":
      spaceCount+=1
    case "a", "e", "i", "o", "u":
      vowelCount+=1
      fallthrough
    case "a"..."z":
      alphaCount+=1
     // fallthrough
    default:
      specialCount+=1
  }
}

print("Vowels: \(vowelCount)")
print("Alphabets: \(alphaCount)")
print("Spaces: \(spaceCount)")
print("Special Characters: \(specialCount)")
print()

let marks = -555

switch marks{
  case let x where x < 0 : //x is a temp variable storing marks and where is a clasue checking if x is less than zero
    print("Invalid Marks")
  case 100:
    print("Topper!")
  case 75...100:
    print("Distinction")
  case 65...75:
    print("First Class")
  case 55...64:
    print("Second Class")
  case 35...55:
    print("Just pass, study harder")
  default:
    print("Fail!! Better luck next time!")
}

//another example
let name = "Synchronoss"
let fCh = name.first ?? " "
let num = fCh.asciiValue ?? 0
print("Ascii value : \(num)")

let name2 = "Synchronoss"
for ch in name2.utf8
{
  print(ch)
}


switch num{
  case 48...57:
    print("name starts with digit")
  case 65...90:
    print("name starts with uppercase digit")
  case 97...122:
    print("Name sarts with lowercase digit")
  default:
    print("name starts with special character")
  
}

