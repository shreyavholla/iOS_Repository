// function type - (int, Int) -> Int

func add(a:Int, b:Int) -> Int{
    return a+b
}

func multiply(a:Int, b:Int) -> Int{
    return a*b
}

var mathOperation : (Int, Int) -> Int //reference

mathOperation = multiply

var res = mathOperation(10,20)
print(res)

//passing function as parameter
//higher order function
func doOperation(a: Int, b:Int, operation: (Int, Int) -> Int){
   
    let result = operation(a,b)
    print("Result: \(result)")
}

doOperation(a: 100, b: 200, operation: add) //passing add function as they have the same signature
doOperation(a: 200, b: 300, operation: multiply)

//return type is a function
func moveToZero(num: Int) -> () -> Int { //all arguments to a function is a let by default
//or make : func moveToZero(@mutating num: Int) -> () -> Int
    var num1 = num
   //inner/ child function
    func increment() -> Int {
        
        num1 += 1
        return num1
    }
    
    func decrement() -> Int{
        
        num1 -= 1
        return num1
    }
    
    return num > 0 ? decrement  : increment
}

 var number = 5

while number != 0 {
    number = moveToZero(num: number)() //calling a function, cz return type is a function
    //OR
//    let op = moveToZero(num: number)
//    number = op()
    
    print("Number = \(number)")
}

//Anonymous Functions



