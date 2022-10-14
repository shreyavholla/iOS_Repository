//function definiton
func add(a:Int, b:Int) -> Int{
   let result = a + b
    print("\(a) + \(b) = \(result)")
  return result
}

//function overloading
func add(a:Double, b:Double) -> Double{
  let res = a + b
  print("\(a) + \(b) = \(res)")
  return res
}

let c = add(a:10, b:20)
let d = add(a:10.2, b:12.5)

// multiple return types using tuple
func getDetails(data: String?) -> (noOfVowels: Int, noOfSpaces: Int){

  guard let inpStr = data else{ //optional binding
    print("Input string is nil")
    return(0, 0)
  }

  //or
  //let inpStr = data ?? ""
  
  let vowel:[Character] = ["a","e","i","o","u"]
  var nov = 0
  var nos = 0

  for ch in  inpStr.lowercased(){
     if(vowel.contains(ch))
    {
      nov+=1
    }
    else if(ch == " ")
    {
      nos+=1
    }
  }

  return (nov,nos)
}

let details = getDetails(data: nil ) //"Good morning"
print("No of Vowels = \(details.noOfVowels)\nNo of Spaces = \(details.noOfSpaces)")


//when return type is optional
//handling exceptions
func divide(_ a:Int, b:Int) -> Int? {
  guard b != 0 else
  {
   print("Denominator is 0, change it...")
   return nil
  }
  return a / b
}

let ans = divide(10, b:0)
print(" \(ans ?? 0)")

//Default Parameters
func calcEMI (amount: Int, rate: Int = 10, duration: Int = 12) {

  let emi = amount * rate / 100
  print(emi:emi, rate:rate, duration:duration)
  
}
func print (emi: Int, rate:Int, duration:Int)
{
  print("Rate = \(rate)")
  print("Duration = \(duration)")
  print("EMI = \(emi)\n")
  
  
}
calcEMI(amount:500, rate:5, duration:5)
calcEMI(amount:600,rate:2)
calcEMI(amount:700,duration:6)
calcEMI(amount:800)

//Veriadic Parameters : can have more than one, do not skip label
func getMax(_ numbers:Int...) -> Int{
  var maxNum = 0
  for num in numbers{
    if(num > maxNum)
    {
      maxNum = num
    }
  }
  return maxNum
}

print("Max num = \(getMax())")
print("Max num = \(getMax(1))")
print("Max num = \(getMax(2,4,6,8))")
print("Max num = \(getMax(3,4,7,2,19,8))")
