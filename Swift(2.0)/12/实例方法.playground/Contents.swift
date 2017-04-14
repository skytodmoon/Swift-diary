//: Playground - noun: a place where people can play

import UIKit

//使用规范的命名
class Employee {
    var no: Int = 0
    var name: String = ""
    var job: String?
    var salary: Double = 0
    var dept: Department?
}

class Department {
    var no: Int = 0
    var name: String = ""
    
    var employees: [Employee] = [Employee]()
    // 结构体和枚举方法变异
    /*
    mutating func insertWithObject(anObject: AnyObject , index: Int)->() {
        
        let emp = anObject as! Employee
        employees.insert(emp, atIndex:index)
    }
    */
    func insertWithObject(anObject: AnyObject , atIndex index: Int)->() {
        //func insertWithObject(anObject: AnyObject , index: Int)->() {
        
        let emp = anObject as! Employee
        employees.insert(emp, atIndex:index)
        
    }
}

var dept = Department()

var emp1 = Employee()
dept.insertWithObject(emp1, atIndex: 0)

var emp2 = Employee()
dept.insertWithObject(emp2, atIndex: 0)

var emp3 = Employee()
dept.insertWithObject(emp3, atIndex: 0)
//dept.insertWithObject(emp3, index: 0)

print(dept.employees.count)

/*
 var dept = Department()
 
 var emp1 = Employee()
 dept.insertWithObject(emp1, index: 0)
 
 var emp2 = Employee()
 dept.insertWithObject(emp2, index: 0)
 
 var emp3 = Employee()
 dept.insertWithObject(emp3, index: 0)
 
 print(dept.employees.count)
 */

//实例方法
class Account {
    
    var amount: Double = 10_000.00         // 账户金额
    var owner: String = "Tony"             //账户名
    
    func interestWithRate(rate: Double) -> Double {
        return rate * amount
    }
}

var myAccount = Account()
//调用实例方法
print(myAccount.interestWithRate(0.088))

//结构体静态方法
struct Account2 {
    
    var owner: String = "Tony"                 //账户名
    static var interestRate: Double = 0.668    //利率
    
    static func interestBy(amount: Double) -> Double {
        return interestRate * amount
    }
    
    func messageWith(amount: Double) -> String {
        
        let interest = Account2.interestBy(amount)
        return "\(self.owner) 的利息是\(interest)"
        
    }
}

//调用静态方法
print(Account2.interestBy(10_000.00))

var myAccount2 = Account2()
//调用实例方法
print(myAccount2.messageWith(10_000.00))

//枚举静态方法
enum Account4 {
    
    case 中国银行
    case 中国工商银行
    case 中国建设银行
    case 中国农业银行
    
    static var interestRate : Double = 0.668 //利率
    
    static func interestBy(amount : Double) -> Double {
        return interestRate * amount
    }
}

//调用静态方法
print(Account4.interestBy(10_000.00 ))

//类静态方法
class Account6 {
    
    var owner : String = "Tony"     //账户名
    
    //可以换成static
    class func interestBy(amount : Double) -> Double {
        //print(self)
        return 0.08886 * amount
    }
}

//调用静态方法
print(Account6
    .interestBy(10_000.00 ))
