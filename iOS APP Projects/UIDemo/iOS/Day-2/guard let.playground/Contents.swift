//guard usage
let data = "Synchronoss India \u{03c0} \u{1F369}"
print(data)
print()
var alphaCount = 0
var spaceCount = 0

for ch in data
{
  guard ch != " " else
  {
    spaceCount+=1
    continue
    
  }
  alphaCount+=1
  //unwrapping an optional using guard
  guard let asciiNum = ch.asciiValue else{
    print("Not an ascii character")
    continue
  }
  print("Ascii Value of \(ch) is \(asciiNum)")
}

print()
print("Alphabets : \(alphaCount)")
print("Spaces : \(spaceCount)")


//using guard let - return - nil outside a function

var var1 : String?

var validVar : String = {
    guard let validVar = var1 else {
        print("not nil")
        return "NIL"
    }
    return validVar
}()

print("\(validVar)")

