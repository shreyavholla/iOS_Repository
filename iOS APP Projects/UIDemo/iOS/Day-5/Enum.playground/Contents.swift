//Enumeration
enum Color {
    
    case red
    case blue
    case green, magenta, white, black
}


var bgColor = Color.black
print(bgColor)
bgColor = .magenta

print(bgColor)

bgColor = .white

//associated values
enum PaymentType {
    
    case creditCard(String, Int)
    case debitCard(String)
    case upi(String)
    case cash
}

var pType = PaymentType.cash

pType = .creditCard("1234", 420)
pType = .debitCard("4567")
pType = .upi("shreyahere27@oksbi")

switch pType {
    case .cash:
        print("Payment is cash")
    
    case .creditCard(let cardnum, let cvv):
        print("Payment by Credit Card number \(cardnum) with cvv \(cvv)")
    
    case .debitCard(let card):
        print("Payment by Debit card num \(card)")

    case .upi(let id):
        print("Payment by UPI ID: \(id)")

    //removing default, cz all scenarious will be executed
}


//another enum of RAW Type INT
enum SettingOption : Int{
    
    case display = 1
    //Enum case cannot have a raw value if the enum does not have a raw type
    
    //no need to assign 2 explicitly, it will automatically increment and assign it implicitly
    case network
    case account
    case others
    case exit = 0
}


var option = SettingOption.display
option = .network
option = .account
option = .others
option = .exit
print(option.rawValue)
print(option.hashValue)

//raw value enum of strings
enum Airport : String {
    
    case bangalore
    case mumbai="BOM", delhi="DLH", hyderabad="HYD"
}

var destination = Airport.bangalore
print("Destination : \(destination.rawValue)") //without even specifying the rawValue, it will return the case

var destination1 = Airport.delhi
print("Destination : \(destination1.rawValue)")


//USAGE OF ENUM : ERROR HANDLING

// THROW


var x : Int = 5
var y : Float = 10.0

let z = 5 + 10.5
