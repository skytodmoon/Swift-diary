//: Playground - noun: a place where people can play

import UIKit

//成员值
enum WeekDays {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
}

//enum WeekDays {
//    case Monday, Tuesday, Wednesday, Thursday, Friday
//}

var day  = WeekDays.Friday
day = WeekDays.Wednesday
day = .Monday

func writeGreeting(day: WeekDays) {
    
    switch day {
    case .Monday:
        print("星期一好！")
    case .Tuesday :
        print("星期二好！")
    case .Wednesday :
        print("星期三好！")
    case .Thursday :
        print("星期四好！")
    case .Friday :
        print("星期五好！")
    }
    //    default:
    //        print("星期五好！")
    
}

writeGreeting(day)
writeGreeting(WeekDays.Friday)


//相关值
enum Figure {
    case Rectangle(Int, Int)
    case Circle(Int)
}

func printFigure(figure: Figure) {
    
    switch figure {
    case .Rectangle(let width, let height):
        //case let .Rectangle(width, height):
        print("矩形的宽:\(width) 高:\(height)")
    case .Circle(let radius):
        print("圆形的半径：\(radius)")
    }
    
}

var figure = Figure.Rectangle(1024, 768)
printFigure(figure)

figure = .Circle(600)
printFigure(figure)


//类和结构体定义
class Employee {
    var no: Int = 0
    var name: String = ""
    var job: String?
    var salary: Double = 0
    var dept: Department?
}


struct Department {
    var no: Int = 0
    var name: String = ""
}

var emp = Employee()
var dept = Department()


//再谈：值类型和引用类型
class Employee2 {
    var no: Int = 0
    var name: String = ""
    var job: String?
    var salary: Double = 0
    var dept: Department?
}

struct Department2 {
    var no: Int = 0
    var name: String = ""
}

var dept2 = Department2()
dept.no = 10
dept.name = "Sales"

let emp2 = Employee2()
emp.no = 1000
emp.name = "Martin"
emp.job = "Salesman"
emp.salary = 1250
emp.dept = dept

func updateDept2(inout dept2: Department) {
    dept2.name = "Research"
}

print("Department更新前:\(dept2.name)")
updateDept2(&dept)
print("Department更新后:\(dept2.name)")

func updateEmp2(emp: Employee) {
    emp.job = "Clerk"
}

print("Employee更新前:\(emp.job)")
updateEmp2(emp)
print("Employee更新后:\(emp.job)")

//引用类型的比较
class Employee3 {
    var no: Int = 0
    var name: String = ""
    var job: String?
    var salary: Double = 0
    var dept: Department?
}


struct Department3 {
    var no: Int = 0
    var name: String = ""
}

let emp3 = Employee3()
emp3.no = 1000
emp3.name = "Martin"
emp3.job = "Salesman"
emp3.salary = 1250

let emp4 = Employee3()
emp4.no = 1000
emp4.name = "Martin"
emp4.job = "Salesman"
emp4.salary = 1250


if emp3 === emp4 {
    print("emp3 === emp4")
}

if emp3 === emp4 {
    print("emp3 === emp4")
}

//if emp1 == emp2 {   //编译失败
//    print("emp1 == emp2")
//}


var dept5 = Department()
dept5.no = 10
dept5.name = "Sales"

var dept6 = Department()
dept6.no = 10
dept6.name = "Sales"

//if dept1 == dept1 {  //编译失败
//    print("dept1 == dept2")
//}

//运算符重载
struct Department22 {
    var no : Int = 0
    var name : String = ""
}

func ==(lhs: Department22, rhs: Department22) -> Bool {
    return lhs.name == rhs.name && lhs.no == rhs.no
}

func !=(lhs: Department22, rhs: Department22) -> Bool {
    if (lhs.name != rhs.name || lhs.no != rhs.no) {
        return true
    }
    return false
}


var dept14 = Department22()
dept14.no = 10
dept14.name = "Sales"

var dept24 = Department22()
dept24.no = 10
dept24.name = "Sales"

if dept14 != dept14 {  //编译失败
    print("dept14 != dept24")
} else {
    print("dept14 == dept24")
}

//对象类型嵌套
 
 class Employee102 {
 
 var no: Int = 0
 var name: String = ""
 var job: String = ""
 var salary: Double = 0
 var dept: Department102 = Department102()
 
 var day: WeekDays = WeekDays.Friday
 
 struct Department102 {
 var no: Int = 10
 var name: String = "SALES"
 }
 
 enum WeekDays {
 case Monday
 case Tuesday
 case Wednesday
 case Thursday
 case Friday
 
 struct Day {
 static var message: String = "Today is..."
 }
 
 }
 
 }

 var emp102 = Employee102()
 
 print(emp102.dept.name)
 
 print(emp102.day)
 
 let friday = Employee102.WeekDays.Friday
 
 if emp102.day == friday {
 print("相等")
 }
 print(Employee102.WeekDays.Day.message)

//可选链1
class Employee101 {
    var no: Int = 0
    var name: String = "Tony"
    var job: String?
    var salary: Double = 0
    var dept: Department101 = Department101()
}


class Department101 {
    var no: Int = 10
    var name: String = "SALES"
    var comp: Company101 = Company101()
}

class Company101 {
    var no: Int = 1000
    var name: String = "EOrient"
}


let emp101 = Employee101()
print(emp101.dept.comp.name)


//可选链2
class Employee103 {
    var no: Int = 0
    var name: String = "Tony"
    var job: String?
    var salary: Double = 0
    var dept: Department103? = Department103()
}


class Department103 {
    var no: Int = 10
    var name: String = "SALES"
    var comp: Company103? = Company103()
}

class Company103 {
    var no: Int = 1000
    var name: String = "EOrient"
}

let emp103 = Employee103()

print(emp103.dept!.comp!.name) //显示拆包
print(emp103.dept?.comp?.name) //可选链

//可选链3

class Employee104 {
    
    var no: Int = 0
    var name: String = ""
    var job: String = ""
    var salary: Double = 0
    var dept: Department104? = Department104()
    
    struct Department104 {
        var no: Int = 10
        var name: String = "SALES"
    }
    
}

let emp104 = Employee104()

print(emp104.dept?.name)


//统一性原则-1
private class Employee105 {
    var no: Int = 0
    var name: String = ""
    var job: String?
    var salary: Double = 0
    var dept: Department105?
}

internal struct Department105 {
    var no: Int = 0
    var name: String = ""
}

/*
public let emp = Employee()       //编译错误

public var dept = Department()    //编译错误
 
public func getEmpDept(emp: Employee) -> Department? {//错误
 return emp.dept
}

*/

//统一性原则-2
public class Employee106 {
    var no: Int = 0
    var name: String = ""
    var job: String?
    var salary: Double = 0
    var dept: Department106?
}

struct Department106 {
    var no: Int = 0
    var name: String = ""
}

private func getEmpDept(emp: Employee106) -> Department106? {
    return emp.dept
}

func getEmpDept106(emp: Employee106) -> Department106? {
    return emp.dept
}

//元祖类型

private class Employee110 {
    var no: Int = 0
    var name: String = ""
    var job: String?
    var salary: Double = 0
    var dept: Department110?
}

struct Department110 {
    var no: Int = 0
    var name: String = ""
}

private let emp110 = Employee110()
var dept110 = Department110()

private var student110 = (dept, emp)
























