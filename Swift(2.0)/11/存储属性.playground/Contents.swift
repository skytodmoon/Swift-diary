//: Playground - noun: a place where people can play

import UIKit

//存储属性
class Employee {
    let no: Int = 0
    var name: String = ""
    var job: String?
    var salary: Double = 0
    var dept: Department?
}

struct Department {
    let no: Int = 0
    var name: String = ""
}

let emp = Employee()
//emp.no = 100            //编译错误

let dept = Department()
//dept.name = "SALES"    //编译错误

let emp1 = Employee()
emp1.name =  "Tony"



//延迟保存属性
class Employee2 {
    var no: Int = 0
    var name: String = ""
    var job: String?
    var salary: Double = 0
    lazy var dept: Department2 = Department2()
}

struct Department2 {
    let no: Int = 0
    var name: String = ""
}

let emp2 = Employee2()
emp2.no = 1000
emp2.name = "Martin"
emp2.job = "Salesman"
emp2.salary = 1250

print(emp2.dept.no)



//计算属性概念
class Employee3 {
    var no: Int = 0
    var firstName: String = "Tony"
    var lastName: String = "Guan"
    var job: String?
    var salary: Double = 0
    lazy var dept: Department3 = Department3()
    
    var fullName: String {
        get {
            return firstName + "." + lastName
        }
        
        //    set (newFullName) {
        //        var name = newFullName.componentsSeparatedByString(".")
        //        firstName = name[0]
        //        lastName = name[1]
        //    }
        
        set {
            var name = newValue.componentsSeparatedByString(".")
            firstName = name[0]
            lastName = name[1]
        }
        
    }
}

struct Department3 {
    let no: Int = 0
    var name: String = ""
}

var emp3 = Employee3()
print(emp3.fullName)

emp3.fullName = "Tom.Guan"
print(emp3.fullName)


//只读计算属性
class Employee4 {
    var no: Int = 0
    var firstName: String = "Tony"
    var lastName: String = "Guan"
    var job: String?
    var salary: Double = 0
    lazy var dept: Department4 = Department4()
    
    var fullName: String {
        return firstName + "." + lastName
    }
}

struct Department4 {
    let no: Int = 0
    var name: String = ""
}

var emp4 = Employee4()
print(emp4.fullName)

//emp.fullName = "Tom.Guan"
//print(emp.fullName)


//属性观察者
class Employee5 {
    var no: Int = 0
    var name: String = "Tony" {
        willSet(newNameValue) {
            print("员工name新值：\(newNameValue)")
        }
        didSet(oldNameValue) {
            print("员工name旧值：\(oldNameValue)")
        }
    }
    var job: String?
    var salary: Double = 0
    var dept: Department5?
}

struct Department5 {
    var no: Int = 10 {
        willSet {
            print("部门编号新值：\(newValue)")
        }
        didSet {
            print("部门编号旧值：\(oldValue)")
        }
    }
    var name: String = "RESEARCH"
}

var emp5 = Employee5()
emp5.no = 100
emp5.name = "Smith"

var dept5 = Department5()
dept5.no = 30


//结构体静态属性
struct Account {
    
    var amount: Double = 0.0               // 账户金额
    var owner: String = ""                 //账户名
    
    static var interestRate: Double = 0.0668 //利率
    
    static var staticProp: Double {
        return interestRate * 1_000_000
    }
    
    var instanceProp: Double {
        return Account.interestRate * amount
    }
}

//访问静态属性
print(Account.staticProp)


var myAccount = Account()
//访问实例属性
myAccount.amount = 1_000_000
//访问静态属性
print(myAccount.instanceProp)


//枚举静态属性
enum Account2 {
    
    case 中国银行
    case 中国工商银行
    case 中国建设银行
    case 中国农业银行
    
    static var interestRate: Double = 0.668  //利率
    
    static var staticProp: Double {
        return interestRate * 1_000_000
    }
    
    var instanceProp: Double {
        
        switch (self) {
        case 中国银行:
            Account.interestRate = 0.667
        case 中国工商银行:
            Account.interestRate = 0.669
        case 中国建设银行:
            Account.interestRate = 0.666
        case 中国农业银行:
            Account.interestRate = 0.668
        }
        return Account.interestRate * 1_000_000
    }
}

//访问静态属性
print(Account2.staticProp)

var myAccount2 = Account2.中国工商银行
//访问实例属性
print(myAccount.instanceProp)


//类静态属性



