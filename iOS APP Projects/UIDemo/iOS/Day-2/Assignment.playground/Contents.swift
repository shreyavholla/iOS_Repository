// print all prime numbers between 1 to 20
//- prime no is divisible by 1 and itself

for i in 2...20
{
  var isPrime = true
  for j in 2..<i
  {
    guard i%j != 0 else
     {
      isPrime = false
      break
     }
    
  }
  if(isPrime)
  {
     print("\(i) ")
  }
   
}
