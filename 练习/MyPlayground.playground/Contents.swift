//: Playground - noun: a place where people can play

import UIKit


//=========================简单值======================
//使用let声明常量，使用var声明变量
var myVariable = 42
myVariable = 50
let myConstans = 42

//没有初始值没有提供的足够信息，那么需要在变量后面声明类型，用冒号分割
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

//值永远不会被隐藏转换为其他类型，如果你需要把一个值转换其他类型，请显示转换
let label = "The width is"
let width = 94
let widthLabel = label + String(width)

//有一种更简单的把值转换成字符串的方法：把值写到括号中，并且在括号之前写一个反斜杠。
let apples = 3
let oranges = 5
let appleSummary = "i have \(apples)apples"
let fruitSummary = "i have \(apples + oranges) pieces of fruit"

//使用方括号[]来创建数组和字典，并使用下标key来访问元素。最后一个元素后面允许有一个逗号
var shoppingList  = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm":"Caption",
    "Kaylee":"Mechanic",
]
occupations["Jayne"] = "Public Relations"

//创建一个空数组活着字典，使用初始化语法
let emptyArray = [String]()
let emptyDictionary = [String: Float]()

//如果类型信息可以被推断出来，你可以用[]和[:]来创建空数组和空字典
shoppingList = []
occupations = [:]

//=========================控制流======================
//if switch for-in for while ,包裹条条件循环变量括号可以省略
//但是语句体的大括号是必须的
let individualScores = [75,43,103,87,12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    }else{
        teamScore += 1
    }
}
print(teamScore)


//一个可选的值是一个具体的值或者nil以表示缺少，在类型后面加上一个
//问号来标记这个变量的值是可选的
var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Applessed"
var greeting = "Hello!"
if let name = optionalName{
    greeting = "Hello,\(name)"
}

//另一种处理可选的方法是通过使用??操作符来提供一个默认值
let nickName: String? = nil
let fullName: String = "John Applessed"
let informalGreeting = "Hi\(nickName ?? fullName)"

//switch支持任意类型的数据以及各种比较操作
let vegetable = "red pepper"
switch vegetable {
    case "celery":
        print("Add some raisins and make ants on a log")
    case "cucumber","watercress":
        print("That would make a good tea sandwich")
case let x where x.hasSuffix("pepper"):
        print("is it a spicy\(x)?")
default:
    print("Everything tastes good in soup")
}

//运行switch中匹配的字句之后，程序会退出switch语句，并不会
//向下运行for-in来遍历字典，需要两个变量表示每个键值对
let interestingNumbers = [
    "Prime":[2,3,4,5,11,13],
    "Fibonace":[1,1,2,3,5,5],
    "Square":[1,4,9,16,25],
]
var largest = 0
for(kind,numbers)in interestingNumbers{
    for numbers in numbers {
        if numbers > largest {
            largest = numbers
        }
    }
}
print(largest)

//使用while来重复运行一段代码直到不满足条件，循环条件也可以结尾
var n = 2
while n < 100 {
    n = n * 2
}
print(n)

var m = 2
repeat {
    m = m * 2
}while m < 100
    print(m)

//..<来表示范围
var total = 0
for i in 0..<4 {
    total += i
}
print(total)

//=========================函数和闭包======================
//使用func来声明一个函数，使用名字和参数来调用函数，使用->来指定函数的返回值
func greet(person:String,day:String) ->String{
    return "Hello\(person),today is \(day)."
}
greet(person: "Bob",day: "Tuesday")


//元祖来让一个函数返回多个值，该元祖的元素可以用名称或数字来表示
func calculateStatistics(scores:[Int]) ->(min: Int, max: Int, sum: Int){
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        }else if score < min {
            min = score
        }
        sum += score
    }
    return(min,max,sum)
}

let statistics = calculateStatistics(scores: [5,3,100,3,9])
print(statistics.sum)
print(statistics.2)

//函数可以带有一个可变个数的参数，这些参数在函数内表现为数组的形式
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(numbers: 43,597,12)

//函数可以嵌套
func returnFifteen() -> Int {
    var y = 10
    func add(){
        y += 5
    }
    add()
    return y
}
returnFifteen()

//函数是第一等类型，这意味着函数可以作为另一个函数的返回值
func makeIncerementer() -> ((Int) -> Int){
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncerementer()
increment(7)


//函数也可以当做参数传入另一个函数
func hasAnyMatches(list: [Int], condition: (Int) -> Bool)-> Bool{
    for item in list {
        if condition(item){
            return true
        }
    }
    return false
}
    
func lessThanThe(number: Int) -> Bool {
        return number < 10
}
var numbers = [20,19,7,12]
hasAnyMatches(list: numbers, condition: lessThanThe)


//函数实际上是一种特殊的闭包:
//它是一段能之后被调取的代码。闭包中的代码能访问闭包所建作用域中能得到的变量和函数，
//即使闭包是在一个不同的作用域被执行的 - 你已经在嵌套函数例子中所看到。
//你可以使用{}来创建一个匿名闭包。使用in将参数和返回值类型声明与闭包函数体进行分离
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})
//有很多种创建更简洁的闭包的方法。
//如果一个闭包的类型已知，比如作为一个回调函数，
//你可以忽略参数的类型和返回值。单个语句闭包会把它语句的值当做结果返回。

let mappedNumbers = numbers.map({number in 3 * number})
print(mappedNumbers)

let sortedNumbers = numbers.sort{$0 > $1}
print(sortedNumbers)

//=========================对象和类======================
//使用class和类名来创建一个类。类中属性的声明和常量、变量声明一样，
//唯一的区别就是它们的上下文是类。同样，方法和函数声明也一样。
class Shape {
    var numberOfSide = 0
    func simpleDescription() -> String {
        return "A shape with \(numbers)sides."
    }
}
//要创建一个类的实例，在类名后面加上括号。使用点语法来访问实例的属性和方法
var shape = Shape()
shape.numberOfSide = 7
var shapeDescription = shape.simpleDescription()

//一个构造函数来初始化类实例。使用init来创建一个构造器
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    func simpleDescription() -> String {
        return "A shape with\(numbers)sides"
    }
}

//例子总结
/*
 注意self被用来区别实例变量。当你创建实例的时候，像传入函数参数一样给类传入构造器的参数。每个属性都需要赋值——无论是通过声明（就像numberOfSides）还是通过构造器（就像name）
 子类的定义方法是在它们的类名后面加上父类的名字，用冒号分割。创建类的时候并不需要一个标准的根类，所以你可以忽略父类。
 
 子类如果要重写父类的方法的话，需要用override标记——如果没有添加override就重写父类方法的话编译器会报错。编译器同样会检测override标记的方法是否确实在父类中。
 */

