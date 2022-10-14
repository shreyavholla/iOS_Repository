let data: [Any] = ["john", 10, 2.3, false, "Merry"]

var strArray: [String] = []
var intArray: [Int] = []
var doubleArray: [Double] = []
var boolArray: [Bool] = []

for item in data {
    
    switch item {
        
    case is String:
        strArray.append(item as! String)
        
    case is Int:
        intArray.append(item as! Int)
        
    case let x as Double:
        doubleArray.append(x)
        
    case let z as Bool:
        boolArray.append(z)
        
    default:
        break
    }
}

print("Strings: \(strArray)")
print("Integers: \(intArray)")
print("Doubles : \(doubleArray)")
print("Boolean: \(boolArray)")

