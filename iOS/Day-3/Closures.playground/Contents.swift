import os
import Darwin
let numbers = [1,2,3,4,5,6,7,8,9,10]

//even numbers

func isEven(num: Int) -> Bool {
    
    return num % 2 == 0 ? true : false
}

var evenNumbers : [Int] = [] //array declaration

for n in numbers {
    if isEven(num:n){
        evenNumbers.append(n)
    }
}

print("Even : \(evenNumbers)")

//Inline function

evenNumbers = numbers.filter(isEven)
print("With filter : \(evenNumbers)")

//Using Closure

evenNumbers = numbers.filter({ (a: Int) -> Bool in
    
    return a % 2 == 0 ? true : false
})

print("With Closure : \(evenNumbers)")

evenNumbers = numbers.filter({ a in
    
    return a % 2 == 0 ? true : false
})

print("With Closure, but simple syntax : \(evenNumbers)")

//get square of numbers

var squareNumbers = numbers.map { a in //trailing closure
    return a * a
}

print("Square of the nos : \(squareNumbers)")

//square of even nos
let sqOfEvenNos = numbers.filter ({ a in a % 2 == 0}).map ({ a in a * a })
print("square of Even numbers : \(sqOfEvenNos)")

// output of filter - length is lesser of equal to the input
// putput of map - length will lways be the same as the input

//highest number
let highestNum = numbers.reduce( 0, { hNum, num in
    
    return hNum > num ? hNum : num
})
print("Highest Number : \(highestNum)")

//Trailing Closure
//----------------------------------------------------------------------------------------------
var opList : [(Int, Int) -> Int] = []//array of functions as elements
//opList is a global function

//escaping closure : its okay to not execute the function : you dont execute inside the body
func addOperation(op: @escaping (Int,Int) -> Int) {
    opList.append(op)
}

//closure functions
//no return statement is required in a closure function --- as the last statement in the function is treated as the return keyword
addOperation { a, b in a + b}
addOperation { x, y in x * y}
addOperation { arg1, arg2 in arg1 / arg2}

for op in opList{
    print(op(10,20))
}

//Closure Assignment
/*
 1.
    data = ["123", "9845123456", "666", "1234567890"]
 
    a. get the valid phone numbers -- having length = 10 digits ---filter()
 
    b. if it is not a valid number, then remove the string and the number should be empty --- map()
 
2.
    names = ["john", "merry", "robert", "Tom", "Elizabeth", "Jerry"]
    a) names starting with vowel --- filter()
    b) lengthiest name --- reduce()
    * use closure
    
 3.
    function for getting factorial of a number
    n! = n * (n-1)
    1! = 1
 */

// 1)
//a
var data = ["123", "9845123456", "666", "1234567890"]

var validPh = data.filter ({ num in num.count == 10
})

print("Valid Phone nos: \(validPh)")


//b

var allData = data.map ({num in num.count == 10 ? num : "" })

print("All Phone nos : \(allData)")

//2.
let names = ["john", "merry", "robert", "Tom", "Elizabeth", "Jerry"]

var vowels: [Character] = ["a","e","i","o","u"]
//a)names starting with vowel
let vowelNames = names.filter { a in
    vowels.contains(a.lowercased().first ?? " ")
    
}

print("Names starting with vowel \(vowelNames)")

//2b)

let lengthiest = names.reduce(names[0], {hNum, a in
    
    return hNum.count > a.count ? hNum : a
    
})

print("Lengthiest name: \(lengthiest)")


//3

func factorial(n:Int) -> Int {
    
    return (n == 1 || n == 0) ? 1 : (n * factorial(n:(n - 1)))
    
}

print(factorial(n:5))


//hacking with swift
//offical documentation + write theory
//swift playground

//make written notes
//transfer all files to xcode

