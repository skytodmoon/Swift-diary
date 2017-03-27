//重写静态方法
class Account {
    //账户名
    var owner: String = "Tony"
    
    //不能换成static
    class func interestBy(amount: Double) -> Double {
        
        return 0.08886 * amount
    }
}

class TermAccount: Account {
    //可以换成static
    override class func interestBy(amount: Double) -> Double {
        return 0.09 * amount
    }
}

//调用静态方法

print(Account.interestBy(10_000.00))
print(TermAccount.interestBy(10_000.00))

//下标重写

class DoubleDimensionalArray {
    
    let rows: Int, cloumns: Int
    
    var grid: [Int]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.cloumns = columns
        grid = Array(count: rows * columns, repeatedValue: 0)
    }
    
    subscript(row: Int, col: Int) -> Int {
        get{
            return grid[(rows * cloumns) + col]
        }
        
        set{
            grid[(rows * cloumns) + col] = newValue
        }
    }
}

class SquareMatrix: DoubleDimensionalArray {
    
    override subscript(row: Int, col: Int) -> Int{
        
        get{
            return super.grid[(rows * cloumns) + col]
        }
        
        set{
            super.grid[(rows * cloumns) + col] = newValue * newValue
        }
    }
}

var ary2 = SquareMatrix(rows: 5, columns: 5)



for i in 0 ..< 5 {
    for j in 0 ..< 5 {
       
    }
    print("\n")
}


//使用final关键字
//我们可以在类的定义中使用final关键字声明类，属性，方法和下标，final声明的类不能被继承，final的属性，方法和下标被重写


//使用is进行类型检查
//is操作符可以判断一个实例是否是某个类型，如果实例是目标类型，结构返回true，否则为false


//使用as，as！和as?进行类型转换

// as!操作符

//let student1 = Student(name: "Tom", age: 18, school: "清华大学")
//let student2 = Student(name: "Ben", age: 28, school: "北京大学")
//let student3 = Student(name: "Tony", age: 38, school: "香港大学")
//
//let worker1 = Worker(name: "Tom", age: 18, factory: "钢厂")
//let worker2 = Worker(name: "Ben", age: 20, factory: "电厂")
//
//let people = [student1,student3,student3,worker1,worker2]
//
//
//
//for item in people {
//    if let student  = item as? Student {
//        print("Student school: \(Student.school)")
//    }else if let worker = item as? Worker{
//        print("Worker factory: \(Worker.factory)")
//    }
//}

//扩展计算属性

//我们可以在原始类型上扩展计算属性，包括实例计算属性和静态属性，这些添加计算属性的定义，与计算属性的定义一样

extension Int {
    var errorMessaeg : String {
        var errorStr = ""
        switch (self) {
        case -7:
            errorStr = "没有数据"
        case -6:
            errorStr = "日期没有输入"
        case -5:
            errorStr = "内容没有输入"
        case -4:
            errorStr = "ID没有输入"
        case -3:
            errorStr = "数据访问失败"
        case -2:
            errorStr = "你的账号最多插入10条数据"
        case -1:
            errorStr = "用户不存在"
        default:
            errorStr = ""
        }
        return errorStr
    }
}

let message = (-7).errorMessaeg
print("Error Code : -7, Error Message : \(message)")


//扩展方法

extension Double {
    static var interestRate : Double = 0.068
    
    func interestBy1() -> Double {
        
        return self * Double.interestRate
    }
    mutating func interestBy2() {
        
        self = self * Double.interestRate
    }
    static func interestBy3(amount: Double) -> Double {
        return interestRate * amount
    }
}

let interest1 = (10_00.00).interestBy1()
print("利息1 : \(interest1)")


let interest2 = 10_00.00
print("利息2 : \(interest2)")


let interest3 = Double.interestBy3(10_00.00)
print("利息3 : \(interest3)")

//值类型扩展结构函数

struct Rectangle {
    
    var width : Double
    var height : Double
    
    init(width : Double, height: Double) {
        self.width = width
        self.height = height
    }
}

extension Rectangle {
    init(length : Double) {
        self.init(width : length, height: length)
    }
}

var rect = Rectangle(width: 320.0, height: 480.0)
print("长方形: \(rect.width) x \(rect.height)")


var square = Rectangle(length: 500.0)
print("长方形: \(square.width) x \(square.height)")

//引用类型扩展结构函数

class Person {
    var name : String
    var age : Int
    
    func description() -> String {
        return "\(name) 年龄是: \(age)"
    }
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    
}

extension Person {
    convenience init (name: String){
        self.init(name: name ,age: 8)
    }
}

let p1 = Person(name: "Mary")
print("Persion1 : \(p1.description())")

let p2 = Person(name: "Toony", age: 28)
print("Persion2 : \(p2.description())")

//扩展下标

extension String {
    subscript(index : Int) ->String {
        if index > self.characters.count {
            return ""
        }
        var c: String = ""
        var i = 0
        
        for characters in self.characters {
            if (i == index){
                c = String(characters)
                break
            }
            i += 1
        }
        return c
    }
}

let s = "Ths quick brown fox  jumos ovar the lazy dog"

print(s[0])
print("ABC"[2])


//协议的概念

//在面向对象分析与设计方法学中，你可能会有这样的经历：一些类的方法所执行的内容是无法确定的，只能它的子类中才能确定
//    - 比如，几何图形类可以绘制图形的方法，但是绘制图形方法的具体内容无法确定，这是因为我们不知道绘制什么样的几何图形
//    - 几何图形这种类在面向对象分享与设计方法学称为抽象类，方法称为抽象方法，矩形和圆形都是几何图形的子类，他们实现了几何图形的绘制图形的抽象方法

protocol Figure {
    func onDraw()//定义抽象绘制几何图形
}

class Rectangle33: Figure {
    func onDraw() {
        print("绘制矩形")
    }
}
class Circle: Figure {
    func onDraw() {
        print("绘制图形")
    }
}

let rect33: Figure = Rectangle33()
rect33.onDraw()

let circle33: Figure = Circle()
circle33.onDraw()

//协议静态方法

protocol Account12 {
    
    static func inerestBy(amount: Double) -> Double
}

class ClassImp : Account12 {
    
    class func inerestBy(amount: Double) -> Double {
        
        return 0.0668 * amount
    }
}

enum EnumImp: Account12 {
    
    static func inerestBy(amount: Double) -> Double {
        
        return 0.0668 * amount
    }
}


//协议变异方法




