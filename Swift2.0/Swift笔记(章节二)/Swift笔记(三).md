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





