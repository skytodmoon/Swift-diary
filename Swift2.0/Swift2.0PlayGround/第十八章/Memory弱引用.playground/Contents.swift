//: Playground - noun: a place where people can play

import UIKit

class Employee {
    var no: Int = 0
    var firstName: String
    var lastName: String
    var job: String
    var salary: Double
    
    init(no: Int, firstName: String, lastName: String, job: String, salary: Double) {
        self.no = no
        self.firstName = firstName
        self.lastName = lastName
        self.job = job
        self.salary = salary
        print("员工\(firstName) 已经构造成功。")
    }
    deinit {
        print("员工\(firstName) 已经析构成功。")
    }
    
    lazy var fullName: ()-> String = {
        [weak self]  ()-> String in
        let fn = self!.firstName
        let ln = self!.lastName
        return fn + "." + ln
    }
}

var emp: Employee? = Employee(no: 7698, firstName: "Tony", lastName: "Guan",
                              job :"Salesman", salary: 1600)

print(emp!.fullName())

emp = nil

