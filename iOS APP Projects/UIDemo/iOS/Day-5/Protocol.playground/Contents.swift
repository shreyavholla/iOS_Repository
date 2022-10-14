class BankAccount {
    var accNumber: String
    var accName: String
    var balance: Int = 0
    
    init(name: String, accNum: String) {
        self.accName = name
        self.accNumber = accNum
    }
    
    func displayInfo() {
        print("Balance details of  \(accName), \(accNumber): \(balance)")
    }
}

//protocol - 1
//1 protocol should do one thing only
protocol creditProtocol {
    
   static  var maxAmountForCredit : Int { get }
    func credit(amount: Int) -> Bool
}
//protocol - 2
protocol debitProtocol {
    
    func debit(amount: Int) -> Bool

}

class SavingAccount: BankAccount, creditProtocol, debitProtocol{
    
    static var maxAmountForCredit: Int = 100000
    
    func credit(amount: Int) -> Bool {
        guard amount < SavingAccount.maxAmountForCredit else {
            return false
        }
        
        balance += amount
        return true
    }
    
    func debit(amount: Int) -> Bool {
        
        guard balance > amount else {
            return false
        }
        balance -= amount
        return true
    }
    
}

class FDAccount : BankAccount, creditProtocol {
    static var maxAmountForCredit: Int = 100000
    static var maxNoOfCredits: Int = 2
    
    var creditCounter = 0
    
    func credit(amount: Int) -> Bool {
        guard amount < FDAccount.maxAmountForCredit && creditCounter <= FDAccount.maxNoOfCredits else {
            return false
        }
        
        balance += amount
        creditCounter += 1
        return true
    }
    
    
    
}

let acc1 = SavingAccount(name: "John", accNum: "1")
let acc2 = FDAccount(name: "Marry", accNum: "2")
let acc3 = SavingAccount(name: "Robert", accNum: "3")
let acc4 = FDAccount(name: "Tom", accNum: "4")

acc1.credit(amount: 1000)
acc2.credit(amount: 2000)
acc3.credit(amount: 3000)
acc4.credit(amount: 5000)
let accList = [acc1, acc2, acc3, acc4]

//deduct 50 from all saving account

for acc in accList {
    
//    if acc is SavingAccount {
//
//        let sAcc = acc as! SavingAccount
//        sAcc.debit(amount: 50)
//
//    }
    if let sAcc = acc as? SavingAccount{
        
        sAcc.debit(amount: 50)
    }
    else if acc is FDAccount {
        print("Cannot Debit from \(acc.accName) as its a FD Account")
    }
    
    acc.displayInfo()
}

protocol CloseProtocol{
    func closeProtocol()
}

extension SavingAccount: CloseProtocol {
    func closeProtocol() {
        balance = 0
    }
}

//close all accounts
for acc in accList{
    if acc is (CloseProtocol & debitProtocol){
        print("Debitting \(acc.accName) Account before closing")
        (acc as! CloseProtocol).closeProtocol()
    }else{
        print("This account \(acc.accName) cannot be closed")
    }
    
    acc.displayInfo()
}


//let acc1 = SavingAccount(name: "John", accNum: "1")
//acc1.displayInfo()
//
//if (acc1.credit(amount: 1000))
//{
//    print("**** Amount Credited ****")
//}
//else
//{
//    print("*** Check the amount to be credited ***")
//}
//acc1.displayInfo()
//
//if (acc1.debit(amount: 500))
//{
//    print("**** Amount Debited ****")
//}
//else{
//    print("*** Insufficient Balance ****")
//}
//acc1.displayInfo()
//
//let acc2 = FDAccount(name: "Marry", accNum: "2")
//acc2.displayInfo()
//
//acc2.credit(amount: 10000)
//acc2.displayInfo()
//
//acc2.credit(amount: 10000)
//acc2.displayInfo()
//
//if(acc2.credit(amount: 10000)) {
//    print("***** FD Account created ***")
//}
//else{
//    print("FD Account can be credited max 2 times")
//}
//acc2.displayInfo()
//
//if(acc2.credit(amount: 1000000)) {
//    print("***** FD Account created ***")
//}
//else{
//    print("FD Account can be credited max 2 times")
//}
//acc2.displayInfo()
