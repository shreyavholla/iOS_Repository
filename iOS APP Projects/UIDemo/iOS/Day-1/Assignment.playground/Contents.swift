var data = "Synchronoss Bangalore India"

//1. no of vowels, no of consonants
//2. does it include '?'
//3. remove first and last character
//4. insert '****' in the center of the string
//5. swap first and last words -- expected : "India Bangalore Synchronoss"


var data = "Synchronoss Bangalore India"

var newData = data.lowercased()
//1. no of vowels, no of consonants
var vowel : [Character] = ["a","e","i","o","u"]
var countVowel = 0
var countConst = 0

for char in newData
{
  if(vowel.contains(char))
  {
    countVowel+=1
  }
  else
  {
   countConst+=1
  }
}

print("No of Vowels = \(countVowel)\nNo of Consonants = \(countConst)")

//2. does it include '?'
if(data.contains("?"))
{
  print("Data contains ?")
}
else{
  print("Data does not contain ?")
}
//3. remove first and last character
data.remove(at: data.startIndex)
data.removeLast(1)
print(data)

//4. insert '****' in the center of the string
data = "Synchronoss Bangalore India"
var length=data.count
var mid = length/2
data.insert(contentsOf:"****", at:data.index(data.startIndex, offsetBy:mid))
print(data)

//5. swap first and last words -- expected : "India Bangalore Synchronoss"

data = "Synchronoss Bangalore India"
/*var words = data.split(separator:" ")
//print(words)
let temp = words[0]
words[0] = words[2]
words[2] = temp

for word in words
{
  print("\(word)", separator:" ", terminator: " ")
}*/

//alternate method
/*var words = data.split(separator:" ")
print(words)
var newSen = words[2] + " " + words[1] + " " + words[0] + "\n"
print(newSen)*/

//another method, cz why not!
/*var words = data.split(separator:" ")
//print(words)
var neord = ""
for i in 0..<words.count
{
 neord += words.removeLast() + " "
}
print(neord)
*/


