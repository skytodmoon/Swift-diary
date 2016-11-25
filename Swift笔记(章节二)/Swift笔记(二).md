# Swift笔记(二)

##### 静态属性

- 在介绍静态属性之前，我们先看看一个类的设计，有一个Account类，假设它们有三个属性：amout insterestReae owner，这三个属性中，会因人而异，对应的账户这些内容是不同的
- amount和owner属性和账户个体有关，称为实例属性，insteresRates属性和个体无关，或者说所有账户个体是共享的，这种属性称为静态属性或者类型属性
- 语法格式

```
	struct 结构体名{
		static var（或者let） 储存属性 = "XXX"
		static var 计算属性名：属性数据类型{
			get {
				return 计算后属性值
			}
			set (新属性值){

			}
		}
	}
	enum 枚举名{
		static var（或者let） 储存属性 = "XXX"
		static var 计算属性名：属性数据类型{
			get {
				return 计算后属性值
			}
			set (新属性值){

			}
		}
	}

		class 类名{
		static var（或者let） 储存属性 = "XXX"
		static var 计算属性名：属性数据类型{
			get {
				return 计算后属性值
			}
			set (新属性值){

			}
		}
	}

```

- 在静态计算属性不能访问实例属性(包括储存属性和计算属性)，但可以访问其他静态属性，在实例计算属性中能访问实例属性，也能访问静态属性

#####结构体静态属性

```
struct Account {
    var amount: Double = 0.0  //账户金额
    var owner: String = ""  //账户名

    static var insteresRete: Double = 0.0668  //利率

    static var staticProp: Double {

        return insteresRete * 1_00_00
    }
        var instanceProp: Double {

            return Account.insteresRete * amount

    }
}

//访问静态属性
print(Account.staticProp)

var myAccount = Account()
//访问实例属性
myAccount.amount = 1_00_00
//访问静态属性
print(myAccount.instanceProp)

```

##### 枚举静态属性

```
enum Account {

    case 中国银行
    case 中国工商银行
    case 中国建设银行
    case 中国农业银行


    static var insteresRete: Double = 0.0668  //利率

    static var staticProp: Double {

        return insteresRete * 1_000_00
    }
    var instanceProp: Double {

        switch self {
        case .中国银行:
            Account.insteresRete = 0.667
        case .中国工商银行:
            Account.insteresRete = 0.687
        case .中国建设银行:
            Account.insteresRete = 0.697
        case .中国农业银行:
            Account.insteresRete = 0.687
        }
        return Account.insteresRete * 1_000_00
    }
}

//访问静态属性
print(Account.staticProp)

var myAccount = Account.中国工商银行

//访问静态属性
print(myAccount.instanceProp)


```

##### 类静态属性

```
struct Account {
    var amount: Double = 0.0  //账户金额
    var owner: String = ""  //账户名

    static let insteresRete: Double = 0.0668  //利率

    static var staticProp: Double {

        return insteresRete * 1_00_00
    }
        var instanceProp: Double {

            return Account.insteresRete * self.amount

    }
}

//访问静态属性
print(Account.staticProp)

var myAccount = Account()
//访问实例属性
myAccount.amount = 1_00_00
//访问静态属性
print(myAccount.instanceProp)

```

- self指当前实例本身


#### 使用下标

##### 下标概念

- Swift中可以定义一些集合类型，它们可能会有一些集合属性的储存属性，这些属性中的元素可以通过下标访问
- 语法格式

```
	面向对象类型 类型名{
		其他类型
		subscipt（参数: 参数数据类型） -> 返回值数据类型{
			get{
				return 返回值
			}

			set (新属性值){

			}
		}
	}

```

#### 二维数组

- Swift中没有提供二位数组,可以定义一个二位数组类型
- 实例

```

struct DoubleDimensionalArray {

    let rows: Int, columns: Int
    var grid: [Int]

    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0)
    }
    subscript(row: Int, col: Int) -> Int {
        get{
            return grid[(row * columns) + col]
        }
        set(newValue1){
            grid[(row * columns) + col] = newValue1
        }
    }
}

var ary2 = DoubleDimensionalArray(rows: 10, columns: 10)

//初始话二位数组
for var i = 0; i < 10; i++ {
    for var j = 0; j < 10; j++ {
        ary2[i,j] = i * j
    }
}

//打印输出二位数组
for var i = 0; i < 10; i++ {
    for var j = 0; j < 10; j++ {
        print("\t (ary2[i,j])")
    }
    print("\n")
}


```

## 方法
##### 实例方法
- 实例方法和实例属性雷士，都属于枚举，结构体或类的个人，我们通过实例化这些类型创建实例，使用调用的方法，类创建的实例可实例陈给对象
- 创建一个结构体

```
class Account {
    var amount: Double = 10_000.00  //账户金额
    var owner: String = "Tony"  //账户名

    //计算利息
    func insterseWithRate(rate: Double ) -> Double {
        return rate * amount
    }

}

//访问静态属性
var myAccount = Account()
print(myAccount.insterseWithRate(0.088))

```
##### 使用规范命名
- 在siwft中，方法和函数的主要区别是下三点
- 方法的调用前面要有主体，而函数不需要
- 方法是在枚举，结构体或类内部定义的
- 方法命名规范和函数不同
- 比较同一个方法的API

```

-(UITableViewCell * )tableview:(UITableView * ）tableview cellForRowATindexPath: (NSINdexPath *)indexpath{}

func tableview:(UITableView: UITableview, cellForRowATindexPath: NSINdexPath) -> UITableViewCell{}

```

- `func insertWithObject(anObject: AnyObject, anIndex index: Int) -> ()`方法有两个参数，第一个参数是anObject，第二个参数是index，外部参数名在方法外访问的时候使用

- 实例. insertWithObject（“元素”, atIndex: 1）
- 实例. insertWithObject（“元素”, index: 1）

- 其中“元素”是要插入的数据，anIndex是外部参数名，index是默认的外部参数名
- 示例

```
	class Employee {
    var no: Int = 0   //员工类
    var firstName: String = "" // 员工编号属性
    var job: String?        //员工姓名属性
    var salary: Double = 0  //工作属性
}

class Department {
    var no: Int = 0
    var name: String = ""
    var employees: [Employee] = [Employee]()

    func insertWithObject(anObject: AnyObject, anIndex index: Int) -> () {

        let emp = anObject as! Employee
        employees.insert(emp, atIndex:index)
    }
}


var dept = Department()

var emp1 = Employee()
dept.insertWithObject(emp1, anIndex: 0)


var emp2 = Employee()
dept.insertWithObject(emp2, anIndex: 0)


var emp3 = Employee()
dept.insertWithObject(emp3, anIndex: 0)

print(dept.employees.count)

```

- 如果外部方法中不指定外部参数名，而是以本地参数作为外部参数名，则修改示例代码

```
  func insertWithObject(anObject: AnyObject, anIndex index: Int) -> () {

        let emp = anObject as! Employee
        employees.insert(emp, atIndex:index)
    }

    dept.insertWithObject(emp1, anIndex: 0)

```


##### 结构体和枚举方法变异

```
class Employee {
    var no: Int = 0   //员工类
    var firstName: String = "" // 员工编号属性
    var job: String?        //员工姓名属性
    var salary: Double = 0  //工作属性
    var dept: Department?
}

struct Department {
    var no: Int = 0
    var name: String = ""
    var employees: [Employee] = [Employee]()

    mutating func insertWithObject(anObject: AnyObject, anIndex index: Int) -> () {

        let emp = anObject as! Employee
        employees.insert(emp, atIndex:index)
    }
}


var dept = Department()

var emp1 = Employee()
dept.insertWithObject(emp1, anIndex: 0)


var emp2 = Employee()
dept.insertWithObject(emp2, anIndex: 0)


var emp3 = Employee()
dept.insertWithObject(emp3, anIndex: 0)

print(dept.employees.count)

```

- 我们在枚举和结构体方法前面添加关键字mutating，将声明方法为异方法，变异方法能够修改为值类型变量属性，但不能修改值类型常量属性
- 变异方法，强调在结构体和枚举的方法中不能修改值类型变量属性，


#### 静态方法

##### 结构静态方法
*Swift中定义静态方法，称为类型方法，静态方法的定义属性类似，枚举和构造体的静态方法使用关键字是static，类静态方法使用的关键字是Class或者static，如果使用static定义，则该方法不能在子类重写*

```

import UIKit

struct Account {

    var owner: String = "Tony"
    static var interestRate: Double = 0.068

    static func interestBy(amount: Double) -> Double {

        return interestRate * amount
    }

    func mesageWith(amount: Double) -> String {

        let interset = Account.interestBy(amount: amount)
        return "\(self.owner)的利息是\(interset)"
    }
}
////调用静态方法
print(Account.interestBy(amount: 100.00))
var myAccount = Account()
//调用实例方法
print(myAccount.mesageWith (1))


```

- Account是结构体。实例声明owner，实例方法能访问实例对象的属性和方法，也能访问静态方法和属性
- Swift中静态方法也能使用self，这在其他面向对象是没有的

##### 枚举静态方法

```
enum Account {

    case 中国银行
    case 中国工商银行
    case 中国建设银行
    case 中国农业银行

    static var intersetRate: Double = 0.0668

    static func interestBy(amount: Double) -> Double {
        return intersetRate * amount
    }
}

print(Account.interestBy(amount: 1))

```
## 构造与解析

- 构造体和类的实例过程中会调用一种特殊的init方法，称为构造函数，构造函数没有返回值，可以重载，在多个构造函数重载情况下，运行环境可以根据他的外部参数或者列表调用合适的构造函数



### 默认构造函数

- 构造体和类过程中会调用一个构造函数，即便没有编写任何构造函数，编译器也会提供一个默认的构造函数

```
class Rectangle {
    var width: Double = 0.0
    var heigth: Double = 0.0
}

var rect = Rectangle()
rect.width = 320.0
rect.heigth = 480.0

print("长方形:\(rect.width) x \(rect.heigth)")

```


- rectangle类，存储属性直接进行初始化，在类中没有定义任务的构造函数，但是我仍然默认函数是inin事实上rectangle表示调用某个方法，这个方法就是默认的构造函数

```
class Rectangle {
    var width: Double = 0.0
    var heigth: Double = 0.0

    init() {
    }


init(width: Double, heigth: Double) {
    self.width = width
    self.heigth = heigth
}
}
```



## 构造函数与储存属性初始化

- 构造函数的主要作用是初始化实例，其中包括：初始话存储属性和其他的初始话
- 如果储存属性在构造函数中没有变化，在定义的时候也没有初始化，那么就会发生编辑错误，计算属性不报错数据，所以不需要初始化，构造函数也不需要初始话静态属性，因为他们与具体事例个体无关

```
class Employee {

    let no : Int
    var name: String?
    var job: String?
    var salary: Double
    var dept: Department?

    init() {
        no = 0
        salary = 0.0
        dept = nil
    }
}

struct Department{

    let no: Int
    var name: String

    init() {
        no = 10
        name = "SALES"
    }
}

let dept = Department()
var emp = Employee()

```

- Employee类和Department构造体，其中Emlopyee的属性都是常量类型属性。常量只能定义的同时赋值，而在构造函数中常量属性可以不遵守这个规则，他们可以在构造函数中赋值，另外存储属性一般在定义的时候初始化，瑞国不能确定初始值，可以采用可选类型属性

### 使用外部参数名

- 为了增强程序的可读性，Swift中的方法可以使用外部参数名，构造函数中也可以使用外部参数名，构造函数中的外部参数名要比一般的方法和函数更有意义，由于构造函数命名都是init，如果一个类型中有多个构造函数，我们可以通过不同的外部参数名区分调用不同的构造函数

```

class RectangleA {
    var width: Double = 0.0
    var heigth: Double = 0.0

    init() {
    }


    init(width: Double, heigth: Double) {
        self.width = width
        self.heigth = heigth
    }
}


class RectangleB {
    var width: Double = 0.0
    var heigth: Double = 0.0



    init(width: Double, heigth: Double) {
        self.width = width
        self.heigth = heigth
    }
}

var rectb = RectangleB(width: 320, heigth: 480)
print("长方形B\(rectb.width) x \(rectb.heigth)")

```

- 方法调用使用第一个参数不需要指定外部参数名，而构造函数调用时不能省略第一个参数的外部参数名
- *前面介绍几个实力适用于类和结构体，但以下写法只适合用于结构体和类型，如果在结构体中使用默认的结构函数*

```
struct RectangleD {
    var width: Double = 0.0
    var heigth: Double = 0.0
}
var rectc = RectangleD(width: 320, heigth: 480)

```

- 代码中使用默认的构造函数，调用它的时候可以指定外部的参数名，机构提类型可以按照从上到下的顺序把属性名作为外部参数名，依次提供参数，这种谢大是一种默认的构造函数，但只适用于机构提，在类中不能使用

#### 构造函数重载

```
class Rectangle {

    var width: Double
    var heigth: Double


    init(width: Double, heigth: Double) {
        self.width = width
        self.heigth = heigth
    }

    init(W width: Double, H heigth: Double) {
        self.width = width
        self.heigth = heigth
    }
    init(length: Double) {

        self.width = length
        self.heigth = length
    }

    init() {
        self.width = 640.0
        self.heigth = 940.0
    }
}

var rect1 = Rectangle (width: 320, heigth: 480)
print("长方形B\(rect1.width) x \(rect1.heigth)")

var rect2 = Rectangle (W: 320, H: 480)
print("长方形B\(rect2.width) x \(rect2.heigth)")

var rect3 = Rectangle(length: 500.0)
print("长方形B\(rect3.width) x \(rect3.heigth)")

var rect4 = Rectangle()
print("长方形B\(rect4.width) x \(rect4.heigth)")

```

#### 构造函数代理

- 为了减少多个构造函数间的代码重复，在定义构造函数是可以通过调用其他函数来完成实例的部分构造过程，这个过程称为构造函数代理，构造函数代理在结构体和类中使用方式不同
- 上述代码修改

```

class Rectangle {

    var width: Double
    var heigth: Double


    init(width: Double, heigth: Double) {
        self.width = width
        self.heigth = heigth
    }

    init(W width: Double, H heigth: Double) {
        self.width = width
        self.heigth = heigth
    }
    convenience init(length: Double) {

        self.init(W: length, H: length)
    }

    convenience init() {
        self.init(width: 640.0, heigth: 940.0)

    }
}

var rect1 = Rectangle (width: 320, heigth: 480)
print("长方形B\(rect1.width) x \(rect1.heigth)")

var rect2 = Rectangle (W: 320, H: 480)
print("长方形B\(rect2.width) x \(rect2.heigth)")

var rect3 = Rectangle(length: 500.0)
print("长方形B\(rect3.width) x \(rect3.heigth)")

var rect4 = Rectangle()
print("长方形B\(rect4.width) x \(rect4.heigth)")


```

#### 类构造函数横向代理
#### 由于类没有继承关系，类构造函数代理比较复杂，分为横向代理和向上代理

- 横向代理雷诗雨机构提类型构造函数代理，发生在同一类内部，这种构造函数称为便利构造函数

- 向上代理发生在继承情况下，在子类构造函数过程中先要调用父类构造函数，初始化父储存属性，这种构造函数称为指定构造函数

- 上述代码

```
class Rectangle {

    var width: Double
    var heigth: Double


    init(width: Double, heigth: Double) {
        self.width = width
        self.heigth = heigth
    }

    init(W width: Double, H heigth: Double) {
        self.width = width
        self.heigth = heigth
    }
    convenience init(length: Double) {

        self.init(W: length, H: length)
    }

    convenience init() {
        self.init(width: 640.0, heigth: 940.0)

    }
}

var rect1 = Rectangle (width: 320, heigth: 480)
print("长方形B\(rect1.width) x \(rect1.heigth)")

var rect2 = Rectangle (W: 320, H: 480)
print("长方形B\(rect2.width) x \(rect2.heigth)")

var rect3 = Rectangle(length: 500.0)
print("长方形B\(rect3.width) x \(rect3.heigth)")

var rect4 = Rectangle()
print("长方形B\(rect4.width) x \(rect4.heigth)")

```

#### 析构函数

- 与构造过程相反，实例最后释放的时候需要清理一些资源，这个过程就是析构函数，析构过程中也会调用一些特殊的方法deinit ，称为析构函数没有返回值，也没有参数，也不需要参数的小括号所以不能重载

- 析构函数只适合用于类，不适合用于枚举和构造体，类似于方法中的c++也称为析构函数，不同的是c++中的析构函数常常用来释放不需要的内存资源，而在siwft中，内存管理采用自动应用计数，不需要析构函数释放不需要实例内存资源

- 示例代码

```

class Rectangle {

    var width: Double
    var heigth: Double


    init(width: Double, heigth: Double) {
        self.width = width
        self.heigth = heigth
    }

    init(W width: Double, H heigth: Double) {
        self.width = width
        self.heigth = heigth
    }
    deinit {
        print("调用析构函数")
        self.width = 0.0
        self.heigth = 0.0
    }
}

var rect1: Rectangle? = Rectangle(width: 320, heigth: 480)
print("长方形:\(rect1!.width) x \(rect1!.heigth)")
rect1 = nil

var rect2: Rectangle? = Rectangle(W: 320, H: 480)
print("长方形B\(rect2!.width) x \(rect2!.heigth)")
rect2 = nil


```

## 类继承

- 继承性是面向对象的重要特征之一，Swift中的继承只能发生在类上，不能发生在枚举和机构体上，在Swift中，一个类可以继承另一个类的方法，属性，下标等。当一个类继承其他的时候，继承叫子类，被继承叫做父类

#### 从一个示例开始

```
class Person {
    var name: String
    var age: Int

    func description() -> String {
        return "\(name) 年龄是: \(age)"
    }
    init() {
        name = ""
        age = 1
    }
}


class Student {
    var name: String
    var age: Int

    var school: String

    func description() -> String {
        return "\(name) 年龄是: \(age)"
    }
    init() {
        school = ""
        name = ""
        age = 1
    }
}

```

```
class Student: Person{
    var school: String
    override init () {
        school = ""
        super.init()
        age = 8
    }
}

```

- student类继承Person类中的所有特征，“：”之后的person类是父类，Swift中的类可以没有父类，叫做基类，override init() 是子类重写父类构造函数
- 一般情况下，一个子类只能继承一个父类，这称为单继承，但有的情况下一个子类可以有多个不同的父类，这成为多继承，在siwft中，类的继承只能单继承，而多重继承可以通过多个协议实现

#### 构造函数继承

- 示例

```

class Person {
    var name: String
    var age: Int

    func description() -> String {
        return "\(name) 年龄是: \(age)"
    }
    convenience init() {
        self.init(name: "Tony")
        self.age = 18
    }

    convenience init(name: String) {
        self.init(name: name, age: 18)
    }
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}


class Student: Person {

    var school: String


    init(name: String, age: Int, school: String) {
        self.school = school
        super.init(name: name, age: age)
    }
    convenience override init (name: String, age: Int){
        self.init(name: name, age: age, school: "清华大学")
    }
}

let student = Student()
print("学生: \(student.description())")

```

- Person类中定义了三个函数，构造函数直接的调用形成了构造函数
- *指定构造函数必须调用其直接父类的指定构造函数*
- *遍历构造函数必须调用同一个类中定义的其他构造函数*
- *遍历构造函数必须最终以调用一个指定的构造函数结束*

#### 构造过程安全检查

- 第一阶段，首先分配内存，初始子类储存属性，沿构造函数向上初始化父类储存属性，到达构造函数顶部，初始话全部的父类储存属性
- 第二阶段 从顶部构造函数往下，可以对每个进一步修改储存属性，调用实例方法处理
- 代码示例

```

import SpriteKit

class Bullet: SKSpriteNode {
    //速度
    var velocity: CGVector

    init(texture: SKTexture?, veloctiy: CGVector) {

        self.velocity = veloctiy

        super.init(texture: texture, color: UIColor.clear, size: (texture?.size())!)

        //构造完成

        self.isHidden = true
        //设置子弹
        let bulletBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody = bulletBody
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

```

#### 安全检查一

```
class Student: Person {

    var school: String


    init(name: String, age: Int, school: String) {
        self.school = school
        super.init(name: name, age: age)
    }
    convenience override init (name: String, age: Int){
        self.init(name: name, age: age, school: "清华大学")
    }
}

```

#### 安全检查二

```

class Student: Person {

    var school: String


    init(name: String, age: Int, school: String) {
        self.school = school
        super.init(name: name, age: age)
        self.name = "Tom"
        self.age = 28
    }
    convenience override init (name: String, age: Int){
        self.init(name: name, age: age, school: "清华大学")
    }
}

```

#### 安全检查三

```
class Student: Person {

    var school: String

    convenience override init (name: String, age: Int){
        self.init(name: name, age: age, school: "清华大学")
		self.name = "Toms"
    }
}


```

#### 安全检查四

```
class Student: Person {

    var school: String


    init(name: String, age: Int, school: String) {
        self.school = school
        //编辑错误
//        self.toString()
        super.init(name: name, age: age)
        self.name = "Tome"
        self.age = 28
        self.toSting()
    }
    convenience override init (name: String, age: Int){
        self.init(name: name, age: age, school: "清华大学")
        self.name = "Tome"
    }

    func toSting() {
        print("Studen : \(school) \(name) \(age)")
    }
}

```

- 我们的在student类添加了toString实例方法，如果在构造函数中调用这个方法，则必须在构造完成之后惊喜，我们不能再代码调用该方法，只能在之后调用，因为代码值第一阶段完成，
- 两段式构造过程中，第一阶段完成是标志是：调用完父类指定构造函数，即super.init语句：如果没有调用父类构造函数，则是调用完本身构造函数，即self，ini语句

#### 构造函数继承

- Swift中的子类构造函数有两种来源：自己编写从父类继承，并不是父类的所有构造函数都能继承下来，能够从父类继承下来的构造函数有条件的
- 条件一： 如果子类没有定义任何指定构造函数，它将自动继承父类的所有指定构造函数
- 条件二： 如果子类提供了所有父类指定构造函数的实现，无论通过条件一继承过来的，还是通过自己变成实现的，它都自动继承父类所有便利构造函数
- 示例代码

```
class Person {
    var name: String
    var age: Int

    func description() -> String {
        return "\(name) 年龄是: \(age)"
    }
    convenience init() {
        self.init(name: "Tony")
        self.age = 18
    }

    convenience init(name: String) {
        self.init(name: name, age: 18)
    }
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}


class Student: Person {

    var school: String


    init(name: String, age: Int, school: String) {
        self.school = school
        super.init(name: name, age: age)
    }
    convenience override init (name: String, age: Int){
        self.init(name: name, age: age, school: "清华大学")
        self.name = "Tome"
    }


}

class Graduate: Student {
    var special: String = ""
}


```

#### 重写
- 一个类继承另一个类的属性，方法，下标等特征，子类可以重写这些特征
- 实例属性的重写一方面可以重写getter和setter访问器，一方面可以重写属性观察者
- 示例代码

```
class Person {
    var name: String
    var age: Int

    func description() -> String {
        return "\(name) 年龄是: \(age)"
    }

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}


class Student: Person {

    var school: String

    override var age: Int {
        get {
            return super.age
        }
        set {
            super.age = newValue < 8 ? 8: newValue
        }
    }

    init(name: String, age: Int, school: String) {
        self.school = school
        super.init(name: name, age: age)
    }
    convenience init () {
        self.init(name: "Tony", age: 18, school: "清华大学")
    }


}

let student1 = Student()
print("学生年龄: \((student1.age))")
student1.age = 6
print("学生年龄: \((student1.age))")


```

- 上述实例代码重写属性getter和setter访问器，我们还可以重写属性观察者

```
class Person {
    var name: String
    var age: Int

    func description() -> String {
        return "\(name) 年龄是: \(age)"
    }

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}


class Student: Person {

    var school: String

    override var age: Int {
        willSet {
            print("学生年龄值: \(newValue)")
        }
        didSet {
            print("学生旧的年龄值: \(oldValue)")
        }
    }

    init(name: String, age: Int, school: String) {
        self.school = school
        super.init(name: name, age: age)
    }
    convenience init () {
        self.init(name: "Tony", age: 18, school: "清华大学")
    }


}

let student1 = Student()
print("学生年龄: \((student1.age))")
student1.age = 6
print("学生年龄: \((student1.age))")

```

- 重写了age属性观察者，重写属性前面添加override关键字，如果修改之前可以重写willSet观察者，如果只关注修改之后调用可以重写didSet观察者，总之是比较灵活的，在观察着，我们可以使用系统分配的默认参数
- 一个属性重写观察者后不能同时getter和setter访问器进行重写，另外常量属性和只读计算属性也都不能重写属性观察者

#### 重写静态属性

- 在类中静态属性定义使用class或者static关键字，但是使用哪一个更要看子类中是否重写属性 class修饰属性可以被重写，static关键字修饰的就不能
- 示例代码

```
class Account {

    var amount: Double = 0.0
    var owner: String = ""

    var interestRate: Double = 0.0688

    class var staticProp: Double {
        return 0.0668 * 1_000_000
    }
    var instanceProp: Double {
        return self.interestRate * self.amount
    }
}

class TermAccount: Account {
    override class var staticProp: Double {
        return 0.0768 * 1_000_000
    }
}

//访问静态属性
print(Account.staticProp)
print(TermAccount.staticProp)


```

### 重写示例方法

```
class Person {
    var name: String
    var age: Int

    func description() -> String {
        return "\(name) 年龄是: \(age)"
    }

    class func printClass() ->() {
        print("Person 打印...")
    }

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}


class Student: Person {

    var school: String

    convenience init () {
        self.init(name: "Tony", age: 18, school: "清华大学")
    }

    init(name: String, age: Int, school: String) {
        self.school = school
        super.init(name: name, age: age)
    }

    override func description () ->String {
        print("父类打印 \(super.description())")
        return "\(name)年龄: \(age),所在学校: \(school)"
    }
    q
    override class func printClass() ->() {
        print("Student 打印....")
    }

}

let student1 = Student()
print("学生1: \((student1.description()))")


Person.printClass()
Student.printClass()

```
