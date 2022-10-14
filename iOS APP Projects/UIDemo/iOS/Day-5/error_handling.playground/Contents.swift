enum MathError : Error {
    case divideByZero
    case invalidArgument
    
}


func divide(number: Int, divisor: Int) throws -> Int{
    
    guard divisor != 0 else {
        
        throw MathError.divideByZero
    }
    return number / divisor
}

//print(divide(number: 10, divisor: 2))
//print(divide(number: 10, divisor: 0))


// Handling error

//1. do-catch : needs an enum
do{
    defer {
        print("Defer block executed") //
    }
    var res = try divide(number: 10, divisor: 2)
    print("10 / 2 = \(res)")
    
    res = try divide(number: 10, divisor: 0)
    print("10 / 0 = \(res)")
    
}catch MathError.divideByZero {
    print("Division BY Zero, result = Infinity")
    
}catch MathError.invalidArgument {
    print("Invalid Arguments")
}catch {
    print("Unknown Errors")
}


//2. convert to an optional : every error thrown has to be caught..cz swift likes winners

if let result = try? divide(number: 10, divisor: 0) {
    print("Division res : \(result)")
}else{
    print("Division Failed")
}

var res : Int = {
    guard let test = try? divide(number: 10, divisor: 0) else {
        print("Division Failed Using Guard Let")
        return 0
    }
    print("Division res : \(test)")
    return test
}()
//print(res)


//3. bypass error handling
func divideByTwo(num: Int) ->Int {
    
    return try! divide(number: num, divisor: 2)
}

let div = divideByTwo(num: 20)
print("Divide by two res = \(div)")

//4. dont handle it rn, propagate it instead
func divideByThree(num: Int) throws -> Int {
      
    return try divide(number: num, divisor: 0)
}

if let res = try? divideByThree(num: 10){
    print("Division by 3 = \(res)")
}else{
    print("Division by 3 failed")

}

print(" ==== DONE ===")


