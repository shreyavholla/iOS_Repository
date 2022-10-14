
var data: Array <Int> = []

struct Stack<T> {
    var data = Array<T> ()
    
    mutating func push(element: T){
        data.append(element)
        display(data: data)
    }
    
    mutating func pop() {
        data.removeLast()
        display(data: data)
        
    }
    
    mutating func display(data: Array<T>) {
        print("\(data)")
    }
}

var names = Stack<String>()

names.push(element: "john")
names.push(element: "marry")
names.push(element: "robert")



names.pop()
names.pop()
names.pop()


//names.pop() // Fatal error: Can't remove last element from an empty collection
//print(names)

//var numbers = Stack<Int>()
