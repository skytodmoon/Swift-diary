//: Playground - noun: a place where people can play

import UIKit

class Employee {
    var no: Int
    var name: String
    var job: String
    var salary: Double
    
    init(no: Int, name: String, job: String, salary: Double) {
        self.no = no
        self.name = name
        self.job = job
        self.salary = salary
        print("员工\(name) 已经构造成功。")
    }
    deinit {
        print("员工\(name) 已经析构成功。")
    }
    
}

var ref1: Employee?
var ref2: Employee?
var ref3: Employee?

ref1 = Employee(no: 7698, name: "Blake", job :"Salesman", salary: 1600)

ref2 = ref1
ref3 = ref1

ref1 = nil
ref2 = nil
ref3 = nil

