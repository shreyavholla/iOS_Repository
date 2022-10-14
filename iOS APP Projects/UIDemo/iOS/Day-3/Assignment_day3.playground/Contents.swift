import UIKit

/*
1. create function to split
input - String, delimiter (default to space)
return - [String]

return - all splits

2. create a function which will join all strings
  input - any no of strings (can have nil)
  return - joined String

3. Create function which will repeat the input String
  input - String (Optional), noOfTimes (default to 2)
  return - String (nil - if input string is nil otherwise repeatedString)

repeatIt("abc",2) - "abcabc"
repeatIt(nil,2) - nil
*/

//1. function to split

func split(sen:String, delimiter:String = " ") -> [String]
{
    let components = sen.components(separatedBy: delimiter)
    return components
}


let res = split(sen:"Hello-there-are-two-words",delimiter: "-")
print(res)

//2.join all strings

func joinString(str: String?...) -> String{
    
  
    var newStr = ""
    for sen in str{
        
        newStr += sen ?? "Nil String Found"
        newStr += " "
    }
    return newStr
}

let newStr = joinString(str:"Hello World", "I am Shreya", "How Are you")
let newStr1 = joinString(str: nil)
let newStr2 = joinString(str: "Hello",nil, "Here")
print(newStr)
print(newStr1)
print(newStr2)

//3.Create function which will repeat the input String
func repeatStr(str: String, num: Int) -> String{
    
    var str1 = str
    while(num > 0)
    {
        str1 += str
    }
    
    return str
}

print(repeatStr(str: "abc", num: 2))

