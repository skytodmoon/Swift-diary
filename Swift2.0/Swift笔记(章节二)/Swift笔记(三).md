# Swift笔记(三)
- 重写静态方法

- 与类静态属性定义类似，静态方法使用class和static关键字，但是用哪一个要看子类是否重写该方法，class修饰静态方法可以被重写

```
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

```

*上诉代码定义了Account和TermAccount两个类,TermAccount继承了Account Account,定义了静态方法*

###### 下标重写
*下标是一种特殊属性。子类属性重写属性的getter和setter访问器，对下标的重写也是重写了下标的getter*

```swift

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
        ary2[i,j] = i+j
    }
}

for i in 0 ..< 5 {
    for j in 0 ..< 5 {
        print("\t\t \(ary2[i,j])")
    }
    print("\n")
}
```
##### 上述定义了类DoubleDimensionalArray，重写了getter访问器，和setter访问器

## 使用final关键字
##### 我们可以在类的定义中使用final关键字声明类，属性，方法和下标，final声明的类不能被继承，final的属性，方法和下标被重写
```swift
final class Person {
    var name: String
    final var age: Int
    
    final func description() ->String {
        return "\(name) 年龄是: \(age)"
    }
    final class func printClass() ->() {
        print("Person 打印中...")
    }
    init (name: String, age: Int){
        self.name = name
        self.age = age
    }
}

class Student: Person {
    
    var school: String
    
    convenience init() {
        self.init(name: "Tony", age: 18, school: "清华大学")
    }
    
    init(name: String, age: Int, school: String) {
        self.school = school
        super.init(name: name, age: age)
    }
    
    override func description() -> String{
        print("父类打印 \(super.description())")
        return("\(name)年龄是：\(age), 所在学校: \(school)")
    }
    
    override class func printClass() ->() {
        print("Student 打印")
    }
    
    override var age: Int {
        get {
            return super.age
        }
        set {
            super.age = newValue < 8 ? 8:newValue
        }
    }
    
}
```

- 会看到有错误，原因是因为声明final不能被继承这是错误
## 类型检查与转换
##### 继承会发生子类和父类之间继承关系， Person是类层次结构中的根类，Student是Person的直接子类

```swift

class Person {
    var name: String
    var age: Int
    
    func description() ->String {
        return "\(name) 年龄是: \(age)"
    }
    
    convenience init (){
        self.init(name: "Tony")
        self.age = 18
    }
    convenience init (name: String) {
        self.init(name: name, age: 18)
    }
    init (name: String, age: Int){
        self.name = name
        self.age = age
    }
}

class Student: Person {
    
    var school: String
    
    init(name: String, age: Int, school: String){
        self.school = school
        super.init(name: name, age: age)
    }
}

class Worker: Person {
    var factory: String
    init(name: String, age: Int,factory: String) {
        self.factory = factory
        super.init(name: name, age: age)
    }
}
```
## 使用is进行类型检查
##### is操作符可以判断一个实例是否是某个类型，如果实例是目标类型，结构返回true，否则为false

```swift
let student1 = Student(name: "Tom", age: 18, school: "清华大学")
let student2 = Student(name: "Ben", age: 28, school: "北京大学")
let student3 = Student(name: "Tony", age: 38, school: "香港大学")

let worker1 = Worker(name: "Tom", age: 18, factory: "钢厂")
let worker2 = Worker(name: "Ben", age: 20, factory: "电厂")

let people = [student1,student3,student3,worker1,worker2]

var studentCount = 0
var workerCount = 0

for item in people {
    if item is Worker {
        ++workerCount
    }else if item is Student {
        ++studentCount
    }
}

print("工厂人数: \(workerCount)，学生rens: \(studentCount)")
```
- 上诉代码使用for in遍历people数组集合，当从people数组集合取出元素，我们只知道是people类型，但是不知道是哪个子类
##### 使用as，as！和as?进行类型转换

- 学习as，as！和as?之前，先了解一下对象的类型转换，并不是所有的类型都能相互转换

```swift

let p1: Person = Student(name: "Tom", age: 18, school: "清华大学")
let  p2: Person = Student(name: "Ben", age: 28, school: "北京大学")
let  p3: Person = Student(name: "Tony", age: 38, school: "香港大学")
let  p4: Student = Student(name: "Tom", age: 18, factory: "钢厂")
let  p5: Worker = Worker(name: "Ben", age: 20, factory: "电厂")

```
- 下面我们详细说明一下as， as！和as？操作符与上下类型之间的关系
##### 1. as操作符
- as操作符仅仅只应用，由于向上转型很少进行，所以代码中很少能够看到使用as操作符的情况
```swift
let p4: Student = Student(name: "Ben", age: 40, school:"清华大学")
let p41: Student = p4 as Person //向上转型
```
- 将Student类型的p4转成Person类型是向上转型，向上转型通常可以省略as Person部分

##### 1. as！操作符号
- 使用as！操作符可以应用如下3中情况，将非可选类型为非可选类型，将非可选类型和将可选类型为可选类型

```swift
//向上转型，使用as！
//1.将非可选类型为非可选类型
let p11 = p1 as! Student
let p6: Person? = Student(name:"Tom", age: 20 ,school: "清华大学")

//let p111  = p2 as! Student //异常

//2.将可选类型为非可选类型

```
- 使用as!操作符时，诺在转换过程中不能转换为目标类型就会出现错误
##### 1. as!操作符
1. 使用as?操作符可以应用于如下两种情况,将非可选类型和非可选类型和将非可选类型为可选类型


```swift
let p6: Person? = Student(name:"Tom", age: 20 ,school: "清华大学")
//向上转型，使用as!
let p21 = p1 as! Student
let p211 = p2 as! Student
//2.将非可选类型为可选类型
let p7: Person? = Student(name:"Tom", age: 20 ,school: "清华大学")
let p22 = p7 as?  Student?
```
- 示例2

```swift
let student1 = Student(name: "Tom", age: 18, school: "清华大学")
let student2 = Student(name: "Ben", age: 28, school: "北京大学")
let student3 = Student(name: "Tony", age: 38, school: "香港大学")

let worker1 = Worker(name: "Tom", age: 18, factory: "钢厂")
let worker2 = Worker(name: "Ben", age: 20, factory: "电厂")

let people = [student1,student3,student3,worker1,worker2]



for item in people {
    if let student  = item as? Student {
        print("Student school: \(Student.school)")
    }else if let worker = item as? Worker{
        print("Worker factory: \(Worker.factory)")
    }
}
```
- 1. 使用for in遍历people数组集合，在循环中，**let student = item as? Student语句使用as?操作符元素换为Student类型：如果转成成功，则把元素赋值给Student变量**
- 2. as?操作符是在不确定是否类型转换能够成功的情况下使用，如果成功转换结果可选类型，如果我们能够确保转换一定成功，可以使用as！操作符在转同时进行隐藏拆包

```swift
let people = Student[student1,student2,student3,worker1,worker2]

let stud1 = people[0] as? Student
print(stud1)
print(stud1!.name)
```
```swift
let stud2 = people[1] as! Student
print(stud2)
print(stud2.name)

Optional(Student）
```

##### 使用Any和AnyObject类型
- 在object-c和Swift混合编程时，object-c的id类型和Swift的AnyObject类型可以呼唤，但是两者有本质区别，id类型是泛型，可以代表任何对象指针类型，编译器不会检查id类型，是动态的，而Swift得anyboject类型是一个实实表示的类型

```swift
let student1 = Student(name: "Tom", age: 18, school: "清华大学")
let student2 = Student(name: "Ben", age: 28, school: "北京大学")
let student3 = Student(name: "Tony", age: 38, school: "香港大学")

let worker1 = Worker(name: "Tom", age: 18, factory: "钢厂")
let worker2 = Worker(name: "Ben", age: 20, factory: "电厂")

let people = [student1,student3,student3,worker1,worker2]

let people1:[Person] = [student1,student2,student3,worker1,worker2]
let people2: [AnyObject]
let people3: [Any] = [student1,student2,student3,worker1,worker2]

for item in people3 {
    if let Student = item as? Student {
        print("Student school: \(Student.school)")
    }else if let Worker = item as? Worker {
        print("Worker factory: \(Worker.factory)")
    }
}
```
- 原则上诺能够使用具体的数据类型，则尽量不要使用Anyobject类型，更要少考虑使用any类型，从集合取出这些实例时，请尽可能将Anyobject或Any类型转换为特定类型

## 扩展

- 扩展机制只在Swift和oc两种语言中有

#### 轻量级继承机制

1. 在面向对象分析与设计方法学中，为了增强一个类的新功能，我们可以通过继承机制从父类继承一些方法和属性，然后再更加需要在子类中添加一些方法和属性，这样就可以得到增强的功能的新类了，但是这种方式受到了限制，继承过程比较烦琐
2. 对于扩展这种‘轻量级’继承机制，只有oc的分类机制此类，其他面向对象的语言没有，因为很多java实用Swift语言不擅长实用扩展机制，而是保守地实用继承机制，在设计基于Swift语言的程序时，我们要优先扩展机制是否能够满足需求

##### 声明扩展

##### 声明扩展的语法格式

```swift
extension 类型名 {
	
	//添加新功能
}
```

- 声明扩展的关键字是extension，“类型名”是Swift中已有的类型，包括类，结构体和枚举，但是我们任然可以扩展整型，浮点型，布尔型，字符串等基本数据类型，因为这些类型本质也是结构类型

```swift
struct Int : SignedIntegerType {
    init()
    init(_ value: Int)
    static func convertFromIntergerLiteral(value: Int) -> Int
    typealias ArrayBoundType = Int
    func getArrayBoundValue() -> Int
    static var max: Int {get}
    static var min: (get)
}
```
- 从定义可见Int是结构体类型，不仅是Int类型，我们熟悉的整型，浮点型，字符串等数据类型本质上都是结构类型
- **具体而言，Swift中的扩展机制可以在原始类型中添加的新功能包括**
- *实例计算属性和类型计算属性*
- *实例方法和类型方法*
- *结构函数*
- *下标*

- 此外，还有嵌套类型等内容也可以扩展，扩展还可以遵从协议

##### 扩展计算属性

- 我们可以在原始类型上扩展计算属性，包括实例计算属性和静态属性，这些添加计算属性的定义，与计算属性的定义一样
- 实例

```swift
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
```

- 定义的Int类型扩展，定义只读计算属性errorMessage，switch是分支语言，Swift表达式self，即当前实例，然后通过Swift的case判断哪个分支，并返回错误描述信息
- 静态属性示例

```swift
let message = (-7).errorMessaeg
print("Error Code : -7, Error Message : \(message)")


struct Account {
    var amount : Double = 0.0
    var owner : String = ""
}

extension Account {
    static var interesRate : Double {
        return 0.0668
    }
}
print(Account.interesRate)
```
- 扩展中不仅可以定义只读计算属性，还可以定义读写计算属性，实例计算属性和静态计算属性，但不能定义存储属性

##### 扩展方法
- 我们可以在原始类型上扩展方法，包括实例方法和静态方法，这些添加方法的定义与普通方法的定义是一样的
- 实例


```swift

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
```


##### 扩展构造函数
- 扩展类型的时候也可以添加新的构造函数。值类型与引用类型扩展有所区别，值类型包括了除类以外的其他类型，主要是枚举类型和结构类型

##### 值类型扩展结构函数

- 代码示例

```swift
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
```
##### 引用类型扩展结构函数

- 下面我们讨论一下引用类扩展中如何定义构造函数，引用类型只包含一个类型，即类的类型

- 扩展类的时候能向类中添加新的便利构造函数，但不能添加新的指定的函数或析函数，指定构造函数和析函数只能由原始类型提供

- 示例

```swift
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
```

##### 扩展下标
- 我们可以把下标认为是特殊的属性，可以实现索引的访问属性，我们可以在元素类型的基础上扩展下标功能
- 字符串本身没有提供按照下标访问字符串的功能

```swift
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
            i++
        }
        return c
    }
}

let s = "Ths quick brown fox  jumos ovar the lazy dog"

print(s[0])
print("ABC"[2])
```









