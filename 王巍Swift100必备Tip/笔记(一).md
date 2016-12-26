# Swift笔记(一)


## Swift语言中的面向对象特征

#### 面向对象概念和基本特征
- 面向对象(oop)是很流行的设计方法，是一种主流的设计规范，其实基本思想就是使用对象，类，继承，封装，属性，方法
- 比如在真实的管理系统中，xxx同学。他们有学号，姓名，班级等属性，学习，问问题，吃饭，走路，这些都是动作，
- oop的基本特征包括：封装性，继承性，还有多态性

```
*封装性: 封装就是尽可能隐藏对象的内部细节，对外形成一个边界，只保留对外接口和外部发生联系*
*继承性：一些特殊类能够具有一般类的全部属性和方法，这称作为特殊类对一般类的继承。比如客轮和轮船，客轮就是特殊类，轮船就是一般类，通常我们称为父类，或称为子类*
*多态性：对象的多态性是指父类中定义的属性或者方法被子类继承之后，可以使用同一个属性或者方法在父类以及各个子类中具有不同的含义，称为多台，比如动物有吃的方法，每个动物都有不同的吃法*

```

#### Swift中的面向对象类型

- 结构体(struct)和枚举(enum)，都是面向对象的数据类型，具有面向对象的特征，而在其他语言中，结构体和枚举是完全没有对象特征
- 在面向对象中类创建对象的过程称为"实例化"，实例化的结果成为“实例”，类的“实例”，也成为“对象”，但是在Swift中，结构体和枚举的实例一般不成为“对象”，这是因为机构提和枚举不是彻底的面向对象类型，而是包含一些面向对象的特点，比如Swift中继承只发生在类上，结构体枚举不能继承

## 枚举
- 枚举是用来管理相关常量的集合，使用枚举可以提高程序的可读性，使用代码更新清晰，而且很容易维护，但是枚举的作用已经不仅仅是定义常量一组常量提高程序的可读性了，它还具有面向对象的特征
语法格式
```
enum 枚举名
{
	枚举的定义
}
```
- “枚举名”，是枚举类型的名称，它首先是有效的识别符，其次应该遵守对象的命名规范，它应该是一个名称，如果采用英文单词名称，首字母应该大写
#### 成员值
- 在枚举类型中定义一组成员，代码示例

```
enum WeekDays {
    case Monday, Tuesday,Wednesday,Thursday,Firday
}

var day  = WeekDays.Firday
day = WeekDays.Wednesday
day = .Monday

func writeGreeting(day: WeekDays)  {

    switch day {
    case .Monday:
        print("星期一好")
    case .Tuesday:
        print("星期二好")
    case .Monday:
        print("星期三好")
    case .Wednesday:
        print("星期四好")
    case .Firday:
        print("星期五好")
    default:
        break
    }
}

writeGreeting(day)
writeGreeting(WeekDays.Firday)

```

- 使用枚举成员赋值，我们可以采用完整的“枚举类型名，成员值”的形式，也可以省略枚举类型儿采用“成员值”的形式，这种省略形式能够访问的前提是，Swift编辑器能够根据上下文环境推断类型
- 为了方便反复的调用，我们定义writeGretting函数，枚举类型siwtch能够很好地配合使用，在switch语句中使用枚举没有default分支
- 在Swift中使用枚举类型时，siwtch语句中的case必须全面包含枚举中的所有成员，不能多也不能少，包括使用default的情况下，defaul也表示某个枚举成员

#### 原始值

- 出于业务上的需求，要为了每个成员提供某种数据类型，我们可以枚举类型提供原始值声明，这些原始值类型可以是字符，整数和浮点数

格式为

```
enum 枚举名: 数据类型
{
 case 成员名 = 默认值
}

```
- 在“枚举名”后面跟“：”和”数据类型“，就可以声明原始值枚举的类型，然后定义case成员的时候需要提供原始值

```
enum WeekDays: Int {
    case Monday = 0
    case Tuesday = 1
    case Wednesday = 2
    case Thursday = 3
    case Firday  = 4
}

```
- 我们声明的Weekdays枚举类型的原始值类型是int，需要给每个成员赋值，只要是int类型都可以，但是每个分支不能重复，我们还可以采用简单的写法，给每个成员赋值，后面的成员会依次加一
- 示例代码

```
enum WeekDays: Int {
    case Monday = 0, Tuesday,Wednesday,Thursday,Firday
}

var day  = WeekDays.Firday


func writeGreeting(day: WeekDays)  {

    switch day {
    case .Monday:
        print("星期一好")
    case .Tuesday:
        print("星期二好")
    case .Monday:
        print("星期三好")
    case .Wednesday:
        print("星期四好")
    case .Firday:
        print("星期五好")
    default:
        break
    }

}

let firday = WeekDays.Firday.rawValue
let thursday = WeekDays(rawValue: 3)

if(WeekDays.Firday.rawValue == 4){
          print("星期五好")
}
writeGreeting(day)
writeGreeting(WeekDays.Firday)

```

#### 相关值

- swi中除了可以定义一组成员值，还可以定义一组相关值，有点类似于oc中的联合类型枚举
- 示例代码

```
enum Figure {
    case Rectangle(Int, Int)
    case Circle(Int)
}

func printFigure(figure: Figure)  {
    switch figure {
    case .Rectangle(let width, let height):
        print("矩形的宽：\(width), 高: \(height)")
    case.Circle(let radius):
        print("圆形的半径为:\(radius)")
    }
}

var figure = Figure.Rectangle(1024, 768)
printFigure(figure)

figure = .Circle(600)
printFigure(figure)

```
- 枚举类型为Figure，为了能够反复的调用，我们代码定义一个函数，其中代码使用了switch语句，为了从相关值提取数据，可以在元祖字段前面添加let和var，如果某个相关元祖中字段类型一直，需要全部提取

## 结构体和类

- Swift语言中非常重视结构体，把结构体作为实现面向对象的手段，Swift中的结构体和c++很大的差别，后面Swift中的结构体不仅可以定义成员变量，还可以定义成员的方法，因此我们可以把结构体看做一种轻量级的类
- Swift中的类和结构体非常类似，都具有定义和使用属性，方法，下标和构造函数面向对象特征，但是结构体不具有继承性，也不具有运行强制类型转换

#### 类和构造体定义

- Swift中的类和构造体定义的语法非常相识，我们可以使用class关键词定义类，使用struct关键字定义结构体，格式是

```
 class 类名{
 	定义类的成员
 }
 struct 结构体名
 {
 	定义结构体的成员
 }

```

- 类名，结构名的命名和枚举类型的要求是一样的，具有的命名规范
- 示例

```
class Employee {
    var no: Int = 0   //员工类
    var name: String = "" // 员工编号属性
    var job: String?        //员工姓名属性
    var salary: Double = 0  //工作属性

    var dept: DEpartment?   //所在部门
}

struct DEpartment {   //所在部门结构体
    var no: Int = 0     //部门编号属性
    var name: String = "" //部门名称属性
}

```
- Employee是我们定义的类，DEpartment是我们的定义的结构体，它们两者有相关的联系，我们可以实例化


```
let emp = Employee()
var dept = Department()
```

- 实例化之后开辟内存空间，emp和dept称为“实例”，但只有类实例化的“实例”，才能称为“对象”，事实上，不仅仅是结构体可以实例化，枚举，函数类型和比包开辟内存空间的过程也可以实例化，结果可以叫“实例”，但不能叫“对象”
- 类声明let常量还是var变量呢？从编程过程中讲类一般声明let常量，由于类引用数据类型，声明为let常量只是说明不能修改引用，但是引用指向的对象可以被修改

#### 值类型和引用类型

- 数据类型可以分支为值类型和引用类型，这是由赋值或者参数传递方式决定的，值类型就是赋值给函数传递参数时创建一个副本，把副本传递过去这样在函数的调用过程中不会影响原始数据，引用累心就是在赋值或者给函数传递参数的时候本身引用传递过去，这样在函数的调用过程中会影响原始数据
- 谨记：只有类是引用类型，其他类型全部都是值类型，即构造体非常相似，它也是值类型。值类型包括整型，浮点型，布尔型，字符串，元组，集合，还有枚举
- 示例

```
class Employee {
    var no: Int = 0   //员工类
    var name: String = "" // 员工编号属性
    var job: String?        //员工姓名属性
    var salary: Double = 0  //工作属性

    var dept: DEpartment?   //所在部门
}

struct DEpartment {   //所在部门结构体
    var no: Int = 0     //部门编号属性
    var name: String = "" //部门名称属性
}

var dept = DEpartment()
dept.no = 10
dept.name = "Sales"

let emp = Employee()
emp.no = 1000
emp.name = "Martin"
emp.job = "Slesman"
emp.salary = 1250
emp.dept = dept

func updateDept ( inout dept: DEpartment){
    dept.name = "Research"
}
print("Department更新前:\(dept.name)")
updateDept(&dept)
print("Department更新后:\(dept.name)")

func unodateEmp(emp: Employee){
    emp.job = "Clerk"
}

print("Department更新前:\(dept.name)")
unodateEmp(emp)
print("Department更新后:\(dept.name)")

```

`func updateDept ( inout dept: DEpartment){
    dept.name = "Research"
}` `dept.name = "Research"`是不能赋值的，因为dept结构体不能修改，它是值类型，要加上inout声明输入输出类型参数


#### 引用类型的比较

```
class Employee {
    var no: Int = 0   //员工类
    var name: String = "" // 员工编号属性
    var job: String?        //员工姓名属性
    var salary: Double = 0  //工作属性

    var dept: DEpartment?   //所在部门
}

struct DEpartment {   //所在部门结构体
    var no: Int = 0     //部门编号属性
    var name: String = "" //部门名称属性
}

var dept = DEpartment()
dept.no = 10
dept.name = "Sales"

let emp1 = Employee()
emp1.no = 1000
emp1.name = "Martin"
emp1.job = "Slesman"
emp1.salary = 1250
emp1.dept = dept

let emp2 = Employee()
emp2.no = 1000
emp2.name = "Martin"
emp2.job = "Slesman"
emp2.salary = 1250
emp2.dept = dept

if emp1 === emp2 {
    print("emp1 === emp2")
}

if emp1 === emp1 {
    print("emp1 === emp1")
}

var dept1 = DEpartment()
dept1.no = 10
dept1.name = "Saler"

var dept2 = DEpartment()
dept2.no = 10
dept2.name = "Saler"


//编译错误
//if dept1 == dept2 {
//    print("dept1 == dept2")
//}

```

- 错误原因是应为dept1和dept2不能比较，==和！=结构体和枚举都属于值类型，我们需要对这些类进行重载

#### 运算符重载

- dept1和dept2不能比较，这时候需要重载运算符 ==和 !=运算符重载就是定义一个重载运算符的函数，在需要执行被重载的运算时调用函数，实现相应的运算

```
struct Department {
    var no: Int = 0
    var name: String = ""
}

func ==(lhs: Department, rhs: Department) -> Bool {
    return lhs.name == rhs.name && lhs.no == rhs.no
}

func !=(lhs: Department, rhs: Department) -> Bool {
    if (lhs.name != rhs.name || lhs.no != rhs.no){
        return true
    }
    return false
}

var dept1 = Department()
dept1.no = 10
dept1.name = "Sales"

var dept2 = Department()
dept2.no = 10
dept2.name = "Sales"



if dept1 == dept2 {
    print("dept1 == dept2")
}else{
    print("dept1 != dept2")
}

if dept1 != dept2 {
    print("dept1 != dept2")
}else{
    print("dept1 == dept2")
}

```
- 重载==运算符，其中第一个参数是左边操作数，第二个参数是右边操作数
- 重载！=运算符，其中第一个参数是左边操作数，第二个参数是右边操作数

#### 类型嵌套

- 嵌套函数的优点是支持访问它外部的成员(包括方法,属性和其他嵌套类型，嵌套还可以多个层次)

- 示例

```
class Employee {
    var no: Int = 0   //员工类
    var name: String = "" // 员工编号属性
    var job: String?        //员工姓名属性
    var salary: Double = 0  //工作属性
    var dept: Department = Department()   //所在部门
    var day: WeekDays = WeekDays.Firday

    struct Department {
        var no: Int = 10
        var name: String = "SALES"
    }

    enum WeekDays {
        case Monday, Tuesday,Wednesday,Thursday,Firday

    struct Day {
        static var message: String = "Today is..."
        }
    }
}


var emp = Employee()
print(emp.dept.name)
print(emp.day)

let friday = Employee.WeekDays.Friday
if emp.day == friday {
    print("相等")
}

```

- 嵌套便于我们访问外部类的成员，但它会使程序结构变得不清楚，使程序的可读性变差

## 可选链

- 有时候我们在Swift程序表达式中，会看到问号，感叹号，他们代表有什么含义，这些符号都和可选类型和可选链相关
- 示例

```
class Employee {
    var no: Int = 0   //员工类
    var name: String = "" // 员工编号属性
    var job: String?        //员工姓名属性
    var salary: Double = 0  //工作属性
    var dept: Department = Department()   //所在部门
}

class  Department {
    var no: Int = 10
    var name: String = "SALES"
    var comp: Company = Company()
}


class Company {
    var no: Int = 1000
    var name: String = "EOrient"
}


let emp = Employee()
print(emp.dept.comp.name)

```

- 公司类，把Department修改为类，它们之间是典型的关联，这些类一般都是实体，实体类是系统中的人，事，物，通过dept属性和Department关联
- Department（）构造函数实例化dept属性，这说明定一个employee实例，一定会有一个Department相关
- 修改后的代码

```
class Employee {
    var no: Int = 0   //员工类
    var name: String = "Tony" // 员工编号属性
    var job: String?        //员工姓名属性
    var salary: Double = 0  //工作属性
    var dept: Department?   //所在部门
}

class  Department {
    var no: Int = 10
    var name: String = "SALES"
    var comp: Company?
}


class Company {
    var no: Int = 1000
    var name: String = "EOrient"
}


let emp = Employee()
print(emp.dept!.comp!.name)
print(emp.dept?.comp?.name)

```

- 问号表示引用的时候，如果某个环节为nil，它不会抛出错误，而是把nil返回给应用者，这种问号引用类型就是`可选链`
- 嵌套类型的实例

```
class Employee {
    var no: Int = 0   //员工类
    var name: String = "" // 员工编号属性
    var job: String = ""       //员工姓名属性
    var salary: Double = 0  //工作属性
    var dept: Department?   //所在部门
}

class  Department {
    var no: Int = 10
    var name: String = "SALES"
}


let emp = Employee()
print(emp.dept?.name)

```

- 输出结果为nil，这是因为emp.dept环节为nil，要修改为

`var dept: Department? =  Department`

### 使用问号和感叹号

- 在使用可选类型和可选链，我们多次使用问号和感叹号，但是它们的含义是不相同的

##### 可选类型中的问号

- 声明这个类型可选类型，访问这种类型的变量或常量使用感叹号

```
let result: Double? = divide(100,100)
print(result!)

```

##### 可选类型中的感叹号

- 声明这个类型可选类型，访问这种类型的变量或常量可以不使用感叹号

```
let result: Double！ = divide(100,100)
print(result)

```

##### 可选链的感叹号

- 多个实例具有关联的关系，当从一个没有实例应用另外一个实例的方法，属性和下标等救赎形成引用链，由于这个链条某些环节可能有值，也可能没有值

```
emp.dept!.comp!.name

```

##### 可选类型中的问号(?)

- 声明这个类型可选类型，访问这种类型的变量或常量使用感叹号

```
emp.dept?.comp?.name

```
- 这样某些环节没有值的时候返回nil，程序不会发生异常

### 访问限定

- 作为一种面向对象的语言封装是不可缺少的，Swift语言是正式版中增加的访问控件，这样一来Swift语言就可以实现复杂特性了

### 访问范围

- 首先，我们需要搞清楚范围的界面，访问范围主要有两个：模块和源文件
- 模块是指一个应用程序包或者一个框架，在siwft中，我们可以用import关键字模块引用到自己的店工程中
- 框架也是很多Swift文件以及其他文件的集合，但是和应用程序包不同的是，它编译的结果不可执行文件
- 源文件是指Swift中的.Swift文件，编译之后被包含在应用程序或者框架中。通常一个源文件包含一个对象类型(类，结构体和枚举)，这些类型又包含函数，属性

### 访问级别

Swift中提供了三种访问级别，对应的访问修饰符是: public internal private，这些访问修饰符可以修改类，结构体，枚举等面向对象的类型，还可以修饰变量，常量，下标，元祖，函数，属性等内容


- `public` 可以访问自己模块中的任何public实体，如果使用import语句引入其他模块，我们可以访问其他模块中的public实体
-  `internal`只能访问自己的模块的任何internal实体，不能访问其他模块的internal实体。internal可以省略，换句话说。默认访问限定是internal
-  `private` 只能在当前源文件使用的实体，称为私有实体，使用private修饰，可以用隐藏某些功能实现细节
-  示例

```
public class PublicClass {}

internal class InternalClass {}

private class PrivateClass {}

public var intPublicVariable = 0

let intInternalConstant = 0

private func inPrivateFunction() {}

```
##### 使用访问级别最佳实践

- 统一原则
- 原则一，*如果一个类型定义为inernal或private，那么类型声明的变量或者常量不能使用public访问级别。因为public的变量或者常量被任何人访问，而internal或private的类型不可以*

- 原则二， *函数的访问级别不能高于它的参数和返回类型的访问级别，假设函数声明为public级别，而参数或者返回类型声明internal或private，就会出现函数可以被任何人访问*
- 示例

```
class Employee {
    var no: Int = 0   //员工类
    var name: String = "" // 员工编号属性
    var job: String?        //员工姓名属性
    var salary: Double = 0  //工作属性
    var dept: DEpartment?   //所在部门
}

internal struct DEpartment {
    var no: Int = 0
    var name: String = ""
}

//编译错误
//public let emp = Employee()
//public var emp = Employee

```

- 定义了private级别的类Employee，所以当代码创建声明emp常量时，会发生编译错误，定义inernal的机构提Departement，创建声明dept变量是，会发生编译错误

```
class Employee {
    var no: Int = 0   //员工类
    var name: String = "" // 员工编号属性
    var job: String?        //员工姓名属性
    var salary: Double = 0  //工作属性
    var dept: DEpartment?   //所在部门
}

internal struct DEpartment {
    var no: Int = 0
    var name: String = ""
}
//编译错误
public func getEmpDept(emp: Employee) -> DEpartment? {
    return emp.dept
}

```

- `getEmpDept`函数中的`Employee`类型级别和函数的访问级别不一致

#### 设计原则

- 如果我们编写的应用程序中，应用程序包中的所有siwft文件某其中定义的实体都是提供应用使用的，而不是提供其他模块使用的，那么我们就不用1设置访问级别了
- 如果我们开发的是框架，框架编译的文件不能独立运行，因此它天生就给被人使用，这种情况要详细设计其中的Swift文件和实体访问的级别，让别人使用的可以设定为public，不想让别人看到的可以设定internal或者private

#### 元祖类型的访问级别

```
class Employee {
    var no: Int = 0   //员工类
    var name: String = "" // 员工编号属性
    var job: String?        //员工姓名属性
    var salary: Double = 0  //工作属性
    var dept: DEpartment?   //所在部门
}

internal struct DEpartment {
    var no: Int = 0
    var name: String = ""
}

private let emp = Employee()
var dept = DEpartment()

private var student1 = (dept, emp)


```

#### 枚举类型的访问级别

```
public enum WeekDays {

    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
}

```

## 选择类还是结构体最佳实践
#### 类和结构体异同
##### 类和结构体都具有以下功能
- 定义存储属性
- 定义方法
- 定义下标
- 定义构造函数
- 定义扩展
- 实现协议

##### 只有类才有的功能

- 能够继承另外一个类
- 能够核对运行时对象的类型
- 分析构对象释放资源
- 引用计数允许一个实例有多个引用

#### 选择的原则

- 结构体是值类型，每一个实例没有独一无二的标识，下面两个数组实例

`var studentList1: [Stirng] = ["张三", "李四" , "王五"]`
`var studentList2: [Stirng] = ["张三", "李四" , "王五"]`

```
class Employee {
    var no: Int = 0   //员工类
    var name: String = "" // 员工编号属性
    var job: String?        //员工姓名属性
    var salary = 0.0  //工作属性

}

var emp1 = Employee()
emp1.no = 100
emp1.name = "Tom"
emp1.job = "SALES"
emp1.salary = 9000


var emp2 = Employee()
emp2.no = 100
emp2.name = "Tom"
emp2.job = "SALES"
emp2.salary = 9000

```

- emp1和emp2两个员工实例即便内容完全相同，也不说明他们就是同一个员工，只是相识而已，每一个员工实例的背后都有独一无二的标识
- 我们再来看看部门结构的Department

```
struct Department {
    var no: Int = 0
    var name: String = ""
}
var dept1 = Department()
dept1.no = 20
dept1.name = "Research"

var dept2 = Department()
dept2.no = 20
dept2.name = "Research"

```

## 属性和下标

##### 储存属性

- 储存属性可以储存数据，分为常量属性，和变量属性

##### 储存属性概念

```
class Employee {
    var no: Int = 0   //员工类
    var name: String = "" // 员工编号属性
    var job: String?        //员工姓名属性
    var salary = 0.0  //工作属性
    var dept: Department?

}

struct Department {
    var no: Int = 0
    var name: String = ""
}



//编译错误
let emp1 = Employee()
emp1.no = 100

let dept = Department()
dept.name = "SALES"

let emp1= Employee()
emp1.name = "Tony"

```

- 引用类型相当于指针，emp1相当于常量指针，常量指针是不能修改的，但是它所指向的内容可以修改，而常量类型，无论是结构体还是枚举类型都不能修改

##### 延迟储存属性

```
class Employee {
    var no: Int = 0   //员工类
    var name: String = "" // 员工编号属性
    var job: String?        //员工姓名属性
    var salary = 0.0  //工作属性
    var dept: Department = Department()
}

struct Department {
    var no: Int = 0
    var name: String = ""
}




let emp = Employee()

```

- 创建`Employee`实例的时候，程序也会有同时实例化属性，然而程序或许不关系其他部门，Swift延迟加载技术

##### 计算属性

##### 计算属性的概念
- 计算属性提供一个geteer来获取值，以及一个可选setter来间接设置其他属性或变量的值，格式语法如下

```
面向对象类型   类型名{
	储存属性

	var 计算属性名：属性数据类型 {
		get {
			return 计算后属性值
		}
		set(新属性值) {

		}
	 }
}

```
- 示例

```


class Employee {
    var no: Int = 0   //员工类
    var firstName: String = "Tony" // 员工编号属性
    var lastName: String = "Guan" // 员工编号属性
    var job: String?        //员工姓名属性
    var salary: Double = 0  //工作属性
    lazy var dept: Department = Department()

var fullName: String {
get {
    return firstName + "." + lastName
}
set (newFullName) {
    var name = newFullName.componentsSeparatedByString(".")
    firstName = name[0]
    lastName = name[0]

}
}
}

struct Department {
    var no: Int = 0
    var name: String = ""
}




var emp = Employee()
print(emp.fullName)

emp.fullName = "Tom.Guan"
print(emp.fullName)


```

- 引入Foundation框架，因为`componentsSeparatedByString`方法是NSString类提供的，使用NSString类需要引入Foundation框架，newFullName虽然传入是string类型，但是String和NSString自动桥接，newFullname自动转化为NSString类型，这样就可以使用`componentsSeparatedByString`方法

##### 自读计算属性

```
class Employee {
    var no: Int = 0   //员工类
    var firstName: String = "Tony" // 员工编号属性
    var lastName: String = "Guan" // 员工编号属性
    var job: String?        //员工姓名属性
    var salary: Double = 0  //工作属性
    lazy var dept: Department = Department()

    var fullName: String {
    return firstName + "." + lastName
    }
}

struct Department {
    var no: Int = 0
    var name: String = ""
}


var emp = Employee()
print(emp.fullName)

```

##### 结构体和枚举中的计算属性

```
struct Department {
    var no: Int = 0
    var name: String = "SALES"

    var fullName: String {

        return "Swift." + name + ".D"
    }

}


var emp = Employee()
print(emp.fullName)

enum WeekDays: String {
    case Monday = "Mon"
    case Tuesdat = "Tue"
    case Wednesday = "Wed"
    case Tuhursd = "Thu"
    case Firday = "Fir"

    var message: String {
        return "Tody is" + "self.rawValue"
    }
}

```

- self可以用于类，结构体，和枚举类型中，代表当前实例，通过self可以访问自身的实例方法和属性，self可以省略，但是如果属性名和局部或者常量名发生冲突，self不能省略

##### 属性观察者

- 为了监听属性的变哈，Swift提供了属性的观察者。属性观察者能够监听储存属性的变化
- Swift的属性观察者有两种
- *willset* 观察者修改之前调用
- *didiset* 观察者修改后调用
- 语法格式

```
面向对象类型 类型名{
	var 储存属性：属性数据类型 = 初始化值 {}
		willset(新值）{

		}
		didSet（旧值){

		}

}

```

- 属性观察者可以在类和结构体中使用。不能再枚举中使用
- 示例

```
class Employee {
    var no: Int = 0
    var name: String = "Tony" {
        willSet(newNameValue) {
            print("员工的name新值: \(newNameValue)")
        }
        didSet(oldNameValue) {
            print("员工的name旧值: \(oldNameValue)")
        }
    }
    var job: String?
    var salary: Double = 0
    var dept: Department?

}

struct Department {
    var no: Int = 0 {
    willSet {
    print("部门的name新值: \(newValue)")
    }
    didSet {
    print("员工的name旧值: \(oldValue)")
    }
}

    var name: String = "RESEARCH"
}

var emp = Employee()
emp.no = 100
emp.name = "SMith"


var dept = Department()
dept.no = 30

```

- 两个属性观察者，我们可以根据自己的需要来使用，它们常常应用于后台处理，以及需要更新界面的业务需求
