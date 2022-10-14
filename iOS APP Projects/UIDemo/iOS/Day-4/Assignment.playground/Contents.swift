/*
 
 1. create clss BankAccount
 
    - accHolderName
    - accountNumber
    - balance
    - interestRate - Computed Property
 
    - methods:
        - displayDetails()
        - calculateInterest()
 
 
 2. create class Saving Account inheritted from BankAccount
 
    - interestRate - different than BankAccount, so override it
 
    - methods
        - deposit(amount)
        - withdraw (amount)
 
 3. create class FDAccount inherited from BankAccount
 
    - interestRate - different than Bank Account (property overriding)
    - maxDepositAmount - Type Property : Static
 */

class BankAccount{
    
    let accHolderName: String
    let accountNumber: String
    var balance: Double
    var duration: Int
    var interestRate: Double {
        
        get{
            return 3.5
        }
    }
    
    init(accName: String, accNo: String, balance: Double, duration: Int){
        
        accHolderName = accName
        accountNumber = accNo
        self.balance = balance
        self.duration = duration
    }
    
    func displayDetails(){
        
        print("\n********* Bank account Created **********")
        print("Name : \(accHolderName)")
        print("Acc No : \(accountNumber)")
        print("Balance : \(balance)")
        print("interestRate : \(interestRate)")
        
        calculateInterest()
        
    }
    
    func calculateInterest() {
        
        let interest =  (balance * Double(duration) * interestRate) / 100
        print("Interest = \(interest)\n")
    }
}

class SavingsAccount: BankAccount {
    
    override var interestRate: Double {
        
        return 4.0
    }
    
    func deposit (amt: Double){
        balance += amt
        print("New Balance on Credit : \(balance)")
    }
    
    func withdraw(amt: Double){
        
        let temp = balance - amt
        
        guard temp > 0 else {
            
            print("Insufficient Balance to Withdraw, please deposit...")
            return
        }
        
        balance = temp
        print("New Balance on Debit : \(balance)")
        
    }
    
    override func displayDetails() {
        super.displayDetails()
        
        print("\n******* Savings Account Created Successfully ********")
    }
}

class FDAccount: BankAccount {
    override var interestRate: Double {
        
        return 5.5
    }
    
    static let maxDepositAmount: Double = 100000.0
    
    override func displayDetails() {
        super.displayDetails()
        print("\n******* FD Account Created Successfully ********")
    }
    
    func checkMaxAmount() {
        
        guard balance <= FDAccount.maxDepositAmount else {
            
            print("***** Max Limit Exceeded ***** ")
            return
        }
        
        displayDetails()
        
    }
    
    
    
    
}

var customer1 = BankAccount(accName: "Shreya", accNo: "12345", balance: 1000.0, duration: 12)
customer1.displayDetails()


var customer2 = SavingsAccount(accName: "Mandara", accNo: "45678", balance: 1000.0, duration: 12)
customer2.displayDetails()
customer2.deposit(amt: 1000)
customer2.withdraw(amt: 500)


var customer3 = FDAccount(accName: "Kailash", accNo: "543210", balance: 2000.0, duration: 12)
customer3.checkMaxAmount()


var customer4 = FDAccount(accName: "Rohit", accNo: "12345", balance: 200000.0, duration: 12)
customer4.checkMaxAmount()
//customer4.displayDetails()
