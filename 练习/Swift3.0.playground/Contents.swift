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
for(_,numbers)in interestingNumbers{
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

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my texy square")
test.area()
test.simpleDescription()


//除了储存简单的属性之外，属性可以有 getter 和 setter
class EquilateralTriangle: NamedShape {
    
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triagle whit sides of length \(sideLength)"
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

//例子总结
/*
 在perimeter的 setter 中，新值的名字是newValue。你可以在set之后显式的设置一个名字。
 注意EquilateralTriangle类的构造器执行了三步：
 
 设置子类声明的属性值
 调用父类的构造器
 改变父类定义的属性值。其他的工作比如调用方法、getters 和 setters 也可以在这个阶段完成。
 如果你不需要计算属性，但是仍然需要在设置一个新值之前或者之后运行代码，使用willSet和didSet。
 */

//下面的类确保三角形的边长总是和正方形的边长相同
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet{
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet{
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another text shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "large square")
print(triangleAndSquare.triangle.sideLength)


//=========================枚举和结构体======================
//使用enum来创建一个枚举。就像类和其他所有命名类型一样，枚举可以包含方法

enum Rank: Int {
    case Ace = 1
    case Two,Thress,Four,Five,Six,Seven,Eight,Nine,Ten
    case Jack,Queen,King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case.Jack:
            return "jack"
        case.Queen:
            return "queen"
        case.King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let accRawValue = ace.rawValue

//枚举的成员值是实际值，并不是原始值的另一种表达方法。实际上，如果没有比较有意义的原始值，你就不需要提供原始值。

enum Suit {
    case Spades,Hearts,Diamonds,Clubs
    func simpleDescription() -> String {
    switch self{
    case.Spades:
        return "spades"
    case.Hearts:
        return "hearts"
    case.Diamonds:
        return "dimonds"
    case.Clubs:
        return "clubs"
        }
    }
}

let hearts = Suit.Hearts
let heartsDesctiption = hearts.simpleDescription()

//例子总结
/*
 注意，有两种方式可以引用Hearts成员：给hearts常量赋值时，枚举成员Suit.Hearts需要用全名来引用，因为常量没有显式指定类型。在switch里，枚举成员使用缩写.Hearts来引用，因为self的值已经知道是一个suit。已知变量类型的情况下你可以使用缩写。
 
 一个枚举成员的实例可以有实例值。相同枚举成员的实例可以有不同的值。创建实例的时候传入值即可。实例值和原始值是不同的：枚举成员的原始值对于所有实例都是相同的，而且你是在定义枚举的时候设置原始值。
 */
// 例如，考虑从服务器获取日出和日落的时间。服务器会返回正常结果或者错误信息。

enum ServerResponse {
        case Result(String,String)
        case Failure(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Failure("Out of cheese.")

switch success {
    
case let .Result(sunrise,sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Failure(message):
    print("Failure... \(message)")
}

//使用struct来创建一个结构体。结构体和类有很多相同的地方，比如方法和构造器。它们之间最大的一个区别就是结构体是传值，类是传引用。

struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String{
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .Thress, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

//=========================协议和扩展======================
//使用protocol来声明一个协议

protocol ExampleProtocol {

    var simpleDescription: String {get}
    mutating func adjust()
}

//类，枚举和结构体都可以实现协议
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A ver simple class"
    var anotherProperty: Int = 69105
    func adjust() {
        
        simpleDescription += "Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDesctiption = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += "(adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

//注意声明SimpleStructure时候mutating关键字用来标记一个会修改结构体的方法。SimpleClass的声明不需要标记任何方法，因为类中的方法通常可以修改类属性（类的性质）。
//使用extension来为现有的类型添加功能，比如新的方法和计算属性。你可以使用扩展在别处修改定义，甚至是从外部库或者框架引入的一个类型，使得这个类型遵循某个协议。

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

//你可以像使用其他命名类型一样使用协议名——例如，创建一个有不同类型但是都实现一个协议的对象集合。当你处理类型是协议的值时，协议外定义的方法不可用。

let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
// print(protocolValue.anotherProperty)  // 去掉注释可以看到错误
//即使protocolValue变量运行时的类型是simpleClass，编译器会把它的类型当做ExampleProtocol。这表示
//=========================错误处理======================

enum PrinterError: Error {
    case OutOfPaper
    case NoToner
    case OnFire
}

//使用throw来抛出一个错误并使用throws来表示一个可以抛出错误的函数。如果在函数中抛出一个错误，这个函数会立刻返回并且调用该函数的代码会进行错误处理。

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner"{
        throw PrinterError.NoToner
    }
    return "Job sent"
}

//有多种方式可以用来进行错误处理。一种方式是使用do-catch。在do代码块中，使用try来标记可以抛出错误的代码。在catch代码块中，除非你另外命名，否则错误会自动命名为error。

do {
    let printResponse = try send(job: 1040, toPrinter: "Bi Shen")
    print(printResponse)
}catch{
    print(error)
}
//可以使用多个catch来护理特定的错误,参考switch中的case风格来写
do{

    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
}catch PrinterError.OnFire{
    print("I will just this over here,with the rest of the fire")
}catch let printerError as PrinterError{
    print("Printer error: \(printerError).")
}catch{
    print(error)
}

//另外处理错误的方法使用try将结果转换为可选的，如果函数出错误，该错误会被抛弃结果为nil
//否则的话，结果会是一个包含函数返回值的可选值 

let printerSuccess = try?send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try?send(job: 1885, toPrinter: "Never Has Toner")

//使用defer代码块来表示在函数返回前，函数中最后执行的代码。无论函数是否会抛出错误，这段代码都将执行。使用defer，可以把函数调用之初就要执行的代码和函数调用结束时的扫尾代码写在一起，虽然这两者的执行时机截然不同。”

//=========================泛型======================

func repeatItem<Item>(repeating item: Item, numberOfTimes: Int) -> [Item]{
    var result = [Item]()
    for _ in 0..<numberOfTimes{
        result.append(item)
    }
    return result
}
repeatItem(repeating: "knock", numberOfTimes: 4)

