//: Playground - noun: a place where people can play

import UIKit


//=========================简单值======================
//使用 let 来声明常量，使用 var 来声明变量。一个常量的值，在编译的时候，并不需要有明确的值，但是你只能为它赋值一次。这说明你可以用一个常量来命名一个值，一次赋值就即可在多个地方使用。
var myVariable = 42
myVariable = 50
let myConstans = 42

//常量或者变量的类型必须和你赋给它们的值一样。然而，你不用明确地声明类型，声明的同时赋值的话，编译器会自动推断类型。在上面的例子中，编译器推断出 myVariable 是一个整数类型（integer）因为它的初始值是整数。
//如果初始值没有提供足够的信息（或者没有初始值），那你需要在变量后面声明类型，用冒号分割。
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


//在 if 语句中，条件必须是一个布尔表达式——这意味着像 if score { ... } 这样的代码将报错，而不会隐形地与 0 做对比。
//你可以一起使用 if 和 let 来处理值缺失的情况。这些值可由可选值来代表。一个可选的值是一个具体的值或者是 nil 以表示值缺失。在类型后面加一个问号来标记这个变量的值是可选的。
var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Applessed"
var greeting = "Hello!"
if let name = optionalName{
    greeting = "Hello,\(name)"
}

//如果变量的可选值是 nil，条件会判断为 false，大括号中的代码会被跳过。如果不是 nil，会将值解包并赋给 let 后面的常量，这样代码块中就可以使用这个值了。
//    另一种处理可选值的方法是通过使用 ?? 操作符来提供一个默认值。如果可选值缺失的话，可以使用默认值来代替。
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
/**
运行 switch 中匹配到的子句之后，程序会退出 switch 语句，并不会继续向下运行，所以不需要在每个子句结尾写 break。
你可以使用 for-in 来遍历字典，需要两个变量来表示每个键值对。字典是一个无序的集合，所以他们的键和值以任意顺序迭代结束。
*/

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


//你也可以创建泛型函数、方法、类、枚举和结构体。
// 重新实现 Swift 标准库中的可选类型
enum OptionalValue<Wrapped> {
    case None
    case Some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)

//在类型名后面使用 where 来指定对类型的需求，比如，限定类型实现某一个协议，限定两个类型是相同的，或者限定某个类必须有一个特定的父类。

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
}
anyCommonElements([1, 2, 3], [3])


/**============================================================================================================================================================================================
 
 **============================================================================================================================================================================================
 **============================================================================================================================================================================================
 **============================================================================================================================================================================================
 **============================================================================================================================================================================================
 **============================================================================================================================================================================================
 */

//
//常量和变量
//声明常量和变量
//类型标注
//常量和变量的命名
//输出常量和变量
//注释
//分号
//整数
//整数范围
//Int
//UInt
//浮点数
//类型安全和类型推断
//数值型字面量
//数值型类型转换
//整数转换
//数整数和浮点数转换
//类型别名
//布尔值
//元组
//可选
//nil
//if 语句以及强制解析
//可选绑定
//隐式解析可选类型
//错误处理
//断言
//

/**常量和变量*/

/**常量和变量把一个名字（比如maximumNumberOfLoginAttempts或者welcomeMessage）和一个指定类型的值（比如数字10或者字符串"Hello"）关联起来。常量的值一旦设定就不能改变，而变量的值可以随意更改。*/


/**声明常量和变量*/

/**常量和变量必须在使用前声明，用let来声明常量，用var来声明变量。下面的例子展示了如何用常量和变量来记录用户尝试登录的次数：*/

let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

/**这两行代码可以被理解为：*/

/**“声明一个名字是maximumNumberOfLoginAttempts的新常量，并给它一个值10。然后，声明一个名字是currentLoginAttempt的变量并将它的值初始化为0。”*/

/**在这个例子中，允许的最大尝试登录次数被声明为一个常量，因为这个值不会改变。当前尝试登录次数被声明为一个变量，因为每次尝试登录失败的时候都需要增加这个值。*/

/**你可以在一行中声明多个常量或者多个变量，用逗号隔开：*/

var x = 0.0, y = 0.0, z = 0.0

/**
 注意：
 如果你的代码中有不需要改变的值，请使用let关键字将它声明为常量。只将需要改变的值声明为变量。
 */


/**类型标注*/

/**当你声明常量或者变量的时候可以加上类型标注（type annotation），说明常量或者变量中要存储的值的类型。如果要添加类型标注，需要在常量或者变量名后面加上一个冒号和空格，然后加上类型名称。*/

/**这个例子给welcomeMessage变量添加了类型标注，表示这个变量可以存储String类型的值：*/

var welcomeMessage: String

/*声明中的冒号代表着“是...类型”，所以这行代码可以被理解为：
 
 “声明一个类型为String，名字为welcomeMessage的变量。”
 
 “类型为String”的意思是“可以存储任意String类型的值。”
 
 welcomeMessage变量现在可以被设置成任意字符串：
 */

welcomeMessage = "Hello"
//你可以在一行中定义多个同样类型的变量，用逗号分割，并在最后一个变量名之后添加类型标注：

var red, green, blue: Double
/***
 注意：
 一般来说你很少需要写类型标注。如果你在声明常量或者变量的时候赋了一个初始值，Swift可以推断出这个常量或者变量的类型，请参考类型安全和类型推断。在上面的例子中，没有给welcomeMessage赋初始值，所以变量welcomeMessage的类型是通过一个类型标注指定的，而不是通过初始值推断的。
 
 */

/**常量和变量的命名*/

/*你可以用任何你喜欢的字符作为常量和变量名，包括 Unicode 字符：*/

let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

/**常量与变量名不能包含数学符号，箭头，保留的（或者非法的）Unicode 码位，连线与制表符。也不能以数字开头，但是可以在常量与变量名的其他地方包含数字。*/

/**一旦你将常量或者变量声明为确定的类型，你就不能使用相同的名字再次进行声明，或者改变其存储的值的类型。同时，你也不能将常量与变量进行互转。
 
 注意：
 如果你需要使用与Swift保留关键字相同的名称作为常量或者变量名，你可以使用反引号（`）将关键字包围的方式将其作为名字使用。无论如何，你应当避免使用关键字作为常量或变量名，除非你别无选择。
 
 你可以更改现有的变量值为其他同类型的值，在下面的例子中，friendlyWelcome的值从"Hello!"改为了"Bonjour!":
 */

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"
// friendlyWelcome 现在是 "Bonjour!"
//与变量不同，常量的值一旦被确定就不能更改了。尝试这样做会导致编译时报错：

/**
 let languageName = "Swift"
 languageName = "Swift++"
 // 这会报编译时错误 - languageName 不可改变
 **/

/**输出常量和变量*/

/**你可以用print(_:separator:terminator:)函数来输出当前常量或变量的值:*/

print(friendlyWelcome)
// 输出 "Bonjour!"

/***
 print(_:separator:terminator:)是一个用来输出一个或多个值到适当输出区的全局函数。如果你用 Xcode，print(_:separator:terminator:)将会输出内容到“console”面板上。separator和terminator参数具有默认值，因此你调用这个函数的时候可以忽略它们。默认情况下，该函数通过添加换行符来结束当前行。如果不想换行，可以传递一个空字符串给terminator参数--例如，print(someValue, terminator:"")。关于参数默认值的更多信息，请参考默认参数值。
 
 Swift 用字符串插值（string interpolation）的方式把常量名或者变量名当做占位符加入到长字符串中，Swift 会用当前常量或变量的值替换这些占位符。将常量或变量名放入圆括号中，并在开括号前使用反斜杠将其转义：
 */

print("The current value of friendlyWelcome is \(friendlyWelcome)")
// 输出 "The current value of friendlyWelcome is Bonjour!
/***
 注意：
 字符串插值所有可用的选项，请参考字符串插值。
 */


/**注释*/

/**请将你的代码中的非执行文本注释成提示或者笔记以方便你将来阅读。Swift 的编译器将会在编译代码时自动忽略掉注释部分。
 
 Swift 中的注释与 C 语言的注释非常相似。单行注释以双正斜杠（//）作为起始标记:
 */

// 这是一个注释
//你也可以进行多行注释，其起始标记为单个正斜杠后跟随一个星号（/*），终止标记为一个星号后跟随单个正斜杠（*/）:

/* 这是一个,
 多行注释 */

/* 与 C 语言多行注释不同，Swift 的多行注释可以嵌套在其它的多行注释之中。你可以先生成一个多行注释块，然后在这个注释块之中再嵌套成第二个多行注释。终止注释时先插入第二个注释块的终止标记，然后再插入第一个注释块的终止标记：
 */
/* 这是第一个多行注释的开头
 /* 这是第二个被嵌套的多行注释 */
 这是第一个多行注释的结尾 */
/**
 
 通过运用嵌套多行注释，你可以快速方便的注释掉一大段代码，即使这段代码之中已经含有了多行注释块。
 
 
 分号
 
 与其他大部分编程语言不同，Swift 并不强制要求你在每条语句的结尾处使用分号（;），当然，你也可以按照你自己的习惯添加分号。有一种情况下必须要用分号，即你打算在同一行内写多条独立的语句：
 */

let cat = "🐱"; print(cat)
// 输出 "🐱"


/** 整数 */

/** 整数就是没有小数部分的数字，比如42和-23。整数可以是有符号（正、负、零）或者无符号（正、零）。*/

/** Swift 提供了8，16，32和64位的有符号和无符号整数类型。这些整数类型和 C 语言的命名方式很像，比如8位无符号整数类型是UInt8，32位有符号整数类型是Int32。就像 Swift 的其他类型一样，整数类型采用大写命名法。*/

/** 整数范围 */

//你可以访问不同整数类型的min和max属性来获取对应类型的最小值和最大值：

let minValue = UInt8.min  // minValue 为 0，是 UInt8 类型
let maxValue = UInt8.max  // maxValue 为 255，是 UInt8 类型

//min和max所传回值的类型，正是其所对的整数类型(如上例UInt8, 所传回的类型是UInt8)，可用在表达式中相同类型值旁。


/** Int */

//一般来说，你不需要专门指定整数的长度。Swift 提供了一个特殊的整数类型Int，长度与当前平台的原生字长相同：
/**
 在32位平台上，Int和Int32长度相同。
 在64位平台上，Int和Int64长度相同。
 除非你需要特定长度的整数，一般来说使用Int就够了。这可以提高代码一致性和可复用性。即使是在32位平台上，Int可以存储的整数范围也可以达到-2,147,483,648~2,147,483,647，大多数时候这已经足够大了。
 
 */

/** UInt */

/**
 
 Swift 也提供了一个特殊的无符号类型UInt，长度与当前平台的原生字长相同：
 
 在32位平台上，UInt和UInt32长度相同。
 在64位平台上，UInt和UInt64长度相同。
 注意：
 尽量不要使用UInt，除非你真的需要存储一个和当前平台原生字长相同的无符号整数。除了这种情况，最好使用Int，即使你要存储的值已知是非负的。统一使用Int可以提高代码的可复用性，避免不同类型数字之间的转换，并且匹配数字的类型推断，请参考类型安全和类型推断。
 
 */

/** 浮点数 */

//浮点数是有小数部分的数字，比如3.14159，0.1和-273.15。
//浮点类型比整数类型表示的范围更大，可以存储比Int类型更大或者更小的数字。Swift 提供了两种有符号浮点数类型：
/**
 Double表示64位浮点数。当你需要存储很大或者很高精度的浮点数时请使用此类型。
 Float表示32位浮点数。精度要求不高的话可以使用此类型。
 注意：
 Double精确度很高，至少有15位数字，而Float只有6位数字。选择哪个类型取决于你的代码需要处理的值的范围。
 */


/** 类型安全和类型推断 */
/*
 Swift 是一个类型安全（type safe）的语言。类型安全的语言可以让你清楚地知道代码要处理的值的类型。如果你的代码需要一个String，你绝对不可能不小心传进去一个Int。
 
 由于 Swift 是类型安全的，所以它会在编译你的代码时进行类型检查（type checks），并把不匹配的类型标记为错误。这可以让你在开发的时候尽早发现并修复错误。
 
 当你要处理不同类型的值时，类型检查可以帮你避免错误。然而，这并不是说你每次声明常量和变量的时候都需要显式指定类型。如果你没有显式指定类型，Swift 会使用类型推断（type inference）来选择合适的类型。有了类型推断，编译器可以在编译代码的时候自动推断出表达式的类型。原理很简单，只要检查你赋的值即可。
 
 因为有类型推断，和 C 或者 Objective-C 比起来 Swift 很少需要声明类型。常量和变量虽然需要明确类型，但是大部分工作并不需要你自己来完成。
 
 当你声明常量或者变量并赋初值的时候类型推断非常有用。当你在声明常量或者变量的时候赋给它们一个字面量（literal value 或 literal）即可触发类型推断。（字面量就是会直接出现在你代码中的值，比如42和3.14159。）
 
 例如，如果你给一个新常量赋值42并且没有标明类型，Swift 可以推断出常量类型是Int，因为你给它赋的初始值看起来像一个整数：
 */

let meaningOfLife = 42
// meaningOfLife 会被推测为 Int 类型

//同理，如果你没有给浮点字面量标明类型，Swift 会推断你想要的是Double：

let pi = 3.14159
// pi 会被推测为 Double 类型

/**
 当推断浮点数的类型时，Swift 总是会选择Double而不是Float。
 如果表达式中同时出现了整数和浮点数，会被推断为Double类型：
 */

let anotherPi = 3 + 0.14159
// anotherPi 会被推测为 Double 类型
//原始值3没有显式声明类型，而表达式中出现了一个浮点字面量，所以表达式会被推断为Double类型。


/** 数值型字面量 */
/**
 整数字面量可以被写作：
 
 一个十进制数，没有前缀
 一个二进制数，前缀是0b
 一个八进制数，前缀是0o
 一个十六进制数，前缀是0x
 下面的所有整数字面量的十进制值都是17:
 */
let decimalInteger = 17
let binaryInteger = 0b10001       // 二进制的17
let octalInteger = 0o21           // 八进制的17
let hexadecimalInteger = 0x11     // 十六进制的17

/**
 浮点字面量可以是十进制（没有前缀）或者是十六进制（前缀是0x）。小数点两边必须有至少一个十进制数字（或者是十六进制的数字）。十进制浮点数也可以有一个可选的指数（exponent)，通过大写或者小写的 e 来指定；十六进制浮点数必须有一个指数，通过大写或者小写的 p 来指定。
 
 如果一个十进制数的指数为exp，那这个数相当于基数和10^exp的乘积：
 
 1.25e2 表示 1.25 × 10^2，等于 125.0。
 1.25e-2 表示 1.25 × 10^-2，等于 0.0125。
 如果一个十六进制数的指数为exp，那这个数相当于基数和2^exp的乘积：
 
 0xFp2 表示 15 × 2^2，等于 60.0。
 0xFp-2 表示 15 × 2^-2，等于 3.75。
 下面的这些浮点字面量都等于十进制的12.1875：
 
 */
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

//数值类字面量可以包括额外的格式来增强可读性。整数和浮点数都可以添加额外的零并且包含下划线，并不会影响字面量：

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1



/** 数值型类型转换 */

//通常来讲，即使代码中的整数常量和变量已知非负，也请使用Int类型。总是使用默认的整数类型可以保证你的整数常量和变量可以直接被复用并且可以匹配整数类字面量的类型推断。

//只有在必要的时候才使用其他整数类型，比如要处理外部的长度明确的数据或者为了优化性能、内存占用等等。使用显式指定长度的类型可以及时发现值溢出并且可以暗示正在处理特殊数据。

/** 整数转换 */

//不同整数类型的变量和常量可以存储不同范围的数字。Int8类型的常量或者变量可以存储的数字范围是-128~127，而UInt8类型的常量或者变量能存储的数字范围是0~255。如果数字超出了常量或者变量可存储的范围，编译的时候会报错：

/**
 let cannotBeNegative: UInt8 = -1
 // UInt8 类型不能存储负数，所以会报错
 let tooBig: Int8 = Int8.max + 1
 // Int8 类型不能存储超过最大值的数，所以会报错
 
 */

//由于每种整数类型都可以存储不同范围的值，所以你必须根据不同情况选择性使用数值型类型转换。这种选择性使用的方式，可以预防隐式转换的错误并让你的代码中的类型转换意图变得清晰。

//要将一种数字类型转换成另一种，你要用当前值来初始化一个期望类型的新数字，这个数字的类型就是你的目标类型。在下面的例子中，常量twoThousand是UInt16类型，然而常量one是UInt8类型。它们不能直接相加，因为它们类型不同。所以要调用UInt16(one)来创建一个新的UInt16数字并用one的值来初始化，然后使用这个新数字来计算：

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)



//现在两个数字的类型都是UInt16，可以进行相加。目标常量twoThousandAndOne的类型被推断为UInt16，因为它是两个UInt16值的和。

//SomeType(ofInitialValue)是调用 Swift 构造器并传入一个初始值的默认方法。在语言内部，UInt16有一个构造器，可以接受一个UInt8类型的值，所以这个构造器可以用现有的UInt8来创建一个新的UInt16。注意，你并不能传入任意类型的值，只能传入UInt16内部有对应构造器的值。不过你可以扩展现有的类型来让它可以接收其他类型的值（包括自定义类型），请参考扩展。


/** 整数和浮点数转换 */
//整数和浮点数的转换必须显式指定类型：
let three = 3
let pointOneFourOneFiveNine = 0.14159
let ipp = Double(three) + pointOneFourOneFiveNine
// ipp 等于 3.14159，所以被推测为 Double 类型
//这个例子中，常量three的值被用来创建一个Double类型的值，所以加号两边的数类型须相同。如果不进行转换，两者无法相加。
//浮点数到整数的反向转换同样行，整数类型可以用Double或者Float类型来初始化：
let integerPi = Int(ipp)
// integerPi 等于 3，所以被推测为 Int 类型

//当用这种方式来初始化一个新的整数值时，浮点值会被截断。也就是说4.75会变成4，-3.9会变成-3。

//注意：
//结合数字类常量和变量不同于结合数字类字面量。字面量3可以直接和字面量0.14159相加，因为数字字面量本身没有明确的类型。它们的类型只在编译器需要求值的时候被推测。


/** 类型别名 */

//类型别名（type aliases）就是给现有类型定义另一个名字。你可以使用typealias关键字来定义类型别名。
//当你想要给现有类型起一个更有意义的名字时，类型别名非常有用。假设你正在处理特定长度的外部资源的数据
typealias AudioSample = UInt16

//定义了一个类型别名之后，你可以在任何使用原始名的地方使用别名：
var maxAmplitudeFound = AudioSample.min
// maxAmplitudeFound 现在是 0
//本例中，AudioSample被定义为UInt16的一个别名。因为它是别名，AudioSample.min实际上是UInt16.min，所以会给maxAmplitudeFound赋一个初值0。

/** 布尔值 */

//Swift 有一个基本的布尔（Boolean）类型，叫做Bool。布尔值指逻辑上的值，因为它们只能是真或者假。Swift 有两个布尔常量，true和false：

let orangesAreOrange = true
let turnipsAreDelicious = false

//orangesAreOrange和turnipsAreDelicious的类型会被推断为Bool，因为它们的初值是布尔字面量。就像之前提到的Int和Double一样，如果你创建变量的时候给它们赋值true或者false，那你不需要将常量或者变量声明为Bool类型。初始化常量或者变量的时候如果所赋的值类型已知，就可以触发类型推断，这让 Swift 代码更加简洁并且可读性更高。

//当你编写条件语句比如if语句的时候，布尔值非常有用：
if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}
// 输出 "Eww, turnips are horrible."

/**
 条件语句，例如if，请参考控制流。
 如果你在需要使用Bool类型的地方使用了非布尔值，Swift 的类型安全机制会报错。下面的例子会报告一个编译时错误：
 */

/**
 let i = 1
 if i {
 // 这个例子不会通过编译，会报错
 }
 */

//然而，下面的例子是合法的：

let j = 1
if j == 1 {
    // 这个例子会编译成功
}
//i == 1的比较结果是Bool类型，所以第二个例子可以通过类型检查。类似i == 1这样的比较，请参考基本操作符。
//和 Swift 中的其他类型安全的例子一样，这个方法可以避免错误并保证这块代码的意图总是清晰的。

/** 元组 */

//元组（tuples）把多个值组合成一个复合值。元组内的值可以是任意类型，并不要求是相同类型。
//下面这个例子中，(404, "Not Found")是一个描述 HTTP 状态码（HTTP status code）的元组。HTTP 状态码是当你请求网页的时候 web 服务器返回的一个特殊值。如果你请求的网页不存在就会返回一个404 Not Found状态码。

let http404Error = (404, "Not Found")
// http404Error 的类型是 (Int, String)，值是 (404, "Not Found")
//(404, "Not Found")元组把一个Int值和一个String值组合起来表示 HTTP 状态码的两个部分：一个数字和一个人类可读的描述。这个元组可以被描述为“一个类型为(Int, String)的元组”。

//   你可以把任意顺序的类型组合成一个元组，这个元组可以包含所有类型。只要你想，你可以创建一个类型为(Int, Int, Int)或者(String, Bool)或者其他任何你想要的组合的元组。

//你可以将一个元组的内容分解（decompose）成单独的常量和变量，然后你就可以正常使用它们了：

let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// 输出 "The status code is 404"
print("The status message is \(statusMessage)")
// 输出 "The status message is Not Found"

//如果你只需要一部分元组值，分解的时候可以把要忽略的部分用下划线（_）标记：
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
// 输出 "The status code is 404"


//此外，你还可以通过下标来访问元组中的单个元素，下标从零开始：
print("The status code is \(http404Error.0)")
// 输出 "The status code is 404"
print("The status message is \(http404Error.1)")
// 输出 "The status message is Not Found"


//你可以在定义元组的时候给单个元素命名：
let http200Status = (statusCode: 200, description: "OK")

//给元组中的元素命名后，你可以通过名字来获取这些元素的值：
print("The status code is \(http200Status.statusCode)")
// 输出 "The status code is 200"
print("The status message is \(http200Status.description)")
// 输出 "The status message is OK"


/*
 *
 作为函数返回值时，元组非常有用。一个用来获取网页的函数可能会返回一个(Int, String)元组来描述是否获取成功。和只能返回一个类型的值比较起来，一个包含两个不同类型值的元组可以让函数的返回信息更有用。请参考函数参数与返回值。
 
 注意：
 元组在临时组织值的时候很有用，但是并不适合创建复杂的数据结构。如果你的数据结构并不是临时使用，请使用类或者结构体而不是元组。请参考类和结构体
 
 */


/** 可选类型 */

/*
 使用可选类型（optionals）来处理值可能缺失的情况。可选类型表示：
 
 有值，等于 x
 或者
 
 没有值
 
 */

/**
 注意：
 C 和 Objective-C 中并没有可选类型这个概念。最接近的是 Objective-C 中的一个特性，一个方法要不返回一个对象要不返回nil，nil表示“缺少一个合法的对象”。然而，这只对对象起作用——对于结构体，基本的 C 类型或者枚举类型不起作用。对于这些类型，Objective-C 方法一般会返回一个特殊值（比如NSNotFound）来暗示值缺失。这种方法假设方法的调用者知道并记得对特殊值进行判断。然而，Swift 的可选类型可以让你暗示任意类型的值缺失，并不需要一个特殊值。
 
 来看一个例子。Swift 的Int类型有一种构造器，作用是将一个String值转换成一个Int值。然而，并不是所有的字符串都可以转换成一个整数。字符串"123"可以被转换成数字123，但是字符串"hello, world"不行。
 
 下面的例子使用这种构造器来尝试将一个String转换成Int：
 
 */

let possibleNumber = "123"
let convertedNUmber = Int(possibleNumber)
// convertedNumber 被推测为类型 "Int?"， 或者类型 "optional Int"

/**
 因为该构造器可能会失败，所以它返回一个可选类型（optional）Int，而不是一个Int。一个可选的Int被写作Int?而不是Int。问号暗示包含的值是可选类型，也就是说可能包含Int值也可能不包含值。（不能包含其他任何值比如Bool值或者String值。只能是Int或者什么都没有。）
 */


/** nil */
//你可以给可选变量赋值为nil来表示它没有值：


var serverResponseCode: Int? = 404
// serverResponseCode 包含一个可选的 Int 值 404
serverResponseCode = nil
// serverResponseCode 现在不包含值

/***
 注意：
 nil不能用于非可选的常量和变量。如果你的代码中有常量或者变量需要处理值缺失的情况，请把它们声明成对应的可选类型。
 
 如果你声明一个可选常量或者变量但是没有赋值，它们会自动被设置为nil：
 
 */
var surveryAnswer: String?
// surveyAnswer 被自动设置为 nil

/***
 注意：
 Swift 的nil和 Objective-C 中的nil并不一样。在 Objective-C 中，nil是一个指向不存在对象的指针。在 Swift 中，nil不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为nil，不只是对象类型。
 */



/** if 语句以及强制解析 */
//你可以使用if语句和nil比较来判断一个可选值是否包含值。你可以使用“相等”(==)或“不等”(!=)来执行比较。
//如果可选类型有值，它将不等于nil:

/*
 
 if convertedNumber != nil {
 print("convertedNumberOf contains some integer value.")
 }
 输出 "convertedNumber contains some integer value."
 
 */

//当你确定可选类型确实包含值之后，你可以在可选的名字后面加一个感叹号（!）来获取值。这个惊叹号表示“我知道这个可选有值，请使用它。”这被称为可选值的强制解析（forced unwrapping）：
/**
 
 if convertedNumber != nil {
 print("convertedNumber has an integer value of \(convertedNumber!).")
 }
 // 输出 "convertedNumber has an integer value of 123."
 
 */

//更多关于if语句的内容，请参考控制流。

/**
 
 注意：
 使用!来获取一个不存在的可选值会导致运行时错误。使用!来强制解析值之前，一定要确定可选包含一个非nil的值。
 
 */


/** 可选绑定 */

//使用可选绑定（optional binding）来判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变量。可选绑定可以用在 if 和 while 语句中，这条语句不仅可以用来判断可选类型中是否有值，同时可以将可选类型中的值赋给一个常量或者变量。if 和 while 语句，请参考控制流。
//像下面这样在 if 语句中写一个可选绑定：


if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
}else{
    print("\'\(possibleNumber)\' could not be converted to an integer")
}
// 输出 "'123' has an integer value of 123"


/**
 
 这段代码可以被理解为：
 
 “如果 Int(possibleNumber) 返回的可选 Int 包含一个值，创建一个叫做 actualNumber 的新常量并将可选包含的值赋给它。”
 
 如果转换成功，actualNumber 常量可以在 if 语句的第一个分支中使用。它已经被可选类型 包含的 值初始化过，所以不需要再使用 ! 后缀来获取它的值。在这个例子中，actualNumber 只被用来输出转换结果。
 
 你可以在可选绑定中使用常量和变量。如果你想在if语句的第一个分支中操作 actualNumber 的值，你可以改成 if var actualNumber，这样可选类型包含的值就会被赋给一个变量而非常量。
 
 你可以包含多个可选绑定或多个布尔条件在一个 if 语句中，只要使用逗号分开就行。只要有任意一个可选绑定的值为nil，或者任意一个布尔条件为false，则整个if条件判断为false，这时你就需要使用嵌套 if 条件语句来处理，如下所示：
 
 */

if let firstNumber = Int("4"),
let secondNumber = Int("42"),
    firstNumber < secondNumber && secondNumber < 100 {
        print("\(firstNumber) < \(secondNumber) < 100")
}
// 输出 "4 < 42 < 100"
if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}
// 输出 "4 < 42 < 100"
/**
 
 注意： 在 if 条件语句中使用常量和变量来创建一个可选绑定，仅在 if 语句的句中(body)中才能获取到值。相反，在 guard 语句中使用常量和变量来创建一个可选绑定，仅在 guard 语句外且在语句后才能获取到值，
 
 **/

/** 隐式解析可选类型 */

//如上所述，可选类型暗示了常量或者变量可以“没有值”。可选可以通过 if 语句来判断是否有值，如果有值的话可以通过可选绑定来解析值。
//有时候在程序架构中，第一次被赋值之后，可以确定一个可选类型总会有值。在这种情况下，每次都要判断和解析可选值是非常低效的，因为可以确定它总会有值。
/**
这种类型的可选状态被定义为隐式解析可选类型（implicitly unwrapped optionals）。把想要用作可选的类型的后面的问号（String?）改成感叹号（String!）来声明一个隐式解析可选类型。

当可选类型被第一次赋值之后就可以确定之后一直有值的时候，隐式解析可选类型非常有用。隐式解析可选类型主要被用在 Swift 中类的构造过程中，请参考无主引用以及隐式解析可选属性。

一个隐式解析可选类型其实就是一个普通的可选类型，但是可以被当做非可选类型来使用，并不需要每次都使用解析来获取可选值。下面的例子展示了可选类型 String 和隐式解析可选类型 String 之间的区别：
*/

let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // 需要感叹号来获取值

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString  // 不需要感叹号

//你可以把隐式解析可选类型当做一个可以自动解析的可选类型。你要做的只是声明的时候把感叹号放到类型的结尾，而不是每次取值的可选名字的结尾。
/**
注意：
如果你在隐式解析可选类型没有值的时候尝试取值，会触发运行时错误。和你在没有值的普通可选类型后面加一个惊叹号一样。

你仍然可以把隐式解析可选类型当做普通可选类型来判断它是否包含值：

*/

if assumedString != nil {
    print(assumedString)
}
// 输出 "An implicitly unwrapped optional string."
//你也可以在可选绑定中使用隐式解析可选类型来检查并解析它的值：
if let definteString = assumedString {
    print(definteString)
}
// 输出 "An implicitly unwrapped optional string."

/**
注意：
如果一个变量之后可能变成nil的话请不要使用隐式解析可选类型。如果你需要在变量的生命周期中判断是否是nil的话，请使用普通可选类型。
*/

/** 错误处理 */

/** 
 你可以使用 错误处理（error handling） 来应对程序执行中可能会遇到的错误条件。
相对于可选中运用值的存在与缺失来表达函数的成功与失败，错误处理可以推断失败的原因，并传播至程序的其他部分。
当一个函数遇到错误条件，它能报错。调用函数的地方能抛出错误消息并合理处理。

func canThrowAnError() throws {
    // 这个函数有可能抛出错误
}
一个函数可以通过在声明中添加throws关键词来抛出错误消息。当你的函数能抛出错误消息时, 你应该在表达式中前置try关键词。

do {
    try canThrowAnError()
    // 没有错误消息抛出
} catch {
    // 有一个错误消息抛出
}
一个do语句创建了一个新的包含作用域,使得错误能被传播到一个或多个catch从句。
这里有一个错误处理如何用来应对不同错误条件的例子。



func makeASandwich() throws {
    // ...
}

do {
    try makeASandwich()
    eatASandwich()
} catch SandwichError.outOfCleanDishes {
    washDishes()
} catch SandwichError.missingIngredients(let ingredients) {
    buyGroceries(ingredients)
}

*/

//在此例中，makeASandwich()（做一个三明治）函数会抛出一个错误消息如果没有干净的盘子或者某个原料缺失。因为 makeASandwich() 抛出错误，函数调用被包裹在 try 表达式中。将函数包裹在一个 do 语句中，任何被抛出的错误会被传播到提供的 catch 从句中。
//如果没有错误被抛出，eatASandwich() 函数会被调用。如果一个匹配 SandwichError.outOfCleanDishes 的错误被抛出，washDishes() 函数会被调用。如果一个匹配 SandwichError.missingIngredients 的错误被抛出，buyGroceries(_:) 函数会被调用，并且使用 catch 所捕捉到的关联值 [String] 作为参数

/** 断言 */

/***
可选类型可以让你判断值是否存在，你可以在代码中优雅地处理值缺失的情况。然而，在某些情况下，如果值缺失或者值并不满足特定的条件，你的代码可能没办法继续执行。这时，你可以在你的代码中触发一个 断言（assertion） 来结束代码运行并通过调试来找到值缺失的原因。

使用断言进行调试
断言会在运行时判断一个逻辑条件是否为 true。从字面意思来说，断言“断言”一个条件是否为真。你可以使用断言来保证在运行其他代码之前，某些重要的条件已经被满足。如果条件判断为 true，代码运行会继续进行；如果条件判断为 false，代码执行结束，你的应用被终止。

如果你的代码在调试环境下触发了一个断言，比如你在 Xcode 中构建并运行一个应用，你可以清楚地看到不合法的状态发生在哪里并检查断言被触发时你的应用的状态。此外，断言允许你附加一条调试信息。

你可以使用全局 assert(_:_:file:line:) 函数来写一个断言。向这个函数传入一个结果为 true 或者 false 的表达式以及一条信息，当表达式的结果为 false 的时候这条信息会被显示：

*/


/***
 注意：
 当代码使用优化编译的时候，断言将会被禁用，例如在 Xcode 中，使用默认的 target Release 配置选项来 build 时，断言会被禁用。
 **/

/** 何时使用断言 */

/***
当条件可能为假时使用断言，但是最终一定要保证条件为真，这样你的代码才能继续运行。断言的适用情景：
整数类型的下标索引被传入一个自定义下标实现，但是下标索引值可能太小或者太大。
需要给函数传入一个值，但是非法的值可能导致函数不能正常执行。
一个可选值现在是 nil，但是后面的代码运行需要一个非 nil 值。
*/


/**============================================================================================================================================================================================
 
 **============================================================================================================================================================================================
 **============================================================================================================================================================================================
 **============================================================================================================================================================================================
 **============================================================================================================================================================================================
 **============================================================================================================================================================================================
 */

//
//术语
//赋值运算符
//算术运算符
//组合赋值运算符
//比较运算符
//三目运算符
//空合运算符
//区间运算符
//逻辑运算符
//


/** 术语 */

//运算符分为一元、二元和三元运算符:

//一元运算符对单一操作对象操作（如 -a）。一元运算符分前置运算符和后置运算符，前置运算符需紧跟在操作对象之前（如 !b），后置运算符需紧跟在操作对象之后（如 c!）。
//二元运算符操作两个操作对象（如 2 + 3），是中置的，因为它们出现在两个操作对象之间。
//三元运算符操作三个操作对象，和 C 语言一样，Swift 只有一个三元运算符，就是三目运算符（a ? b : c）。
//受运算符影响的值叫操作数，在表达式 1 + 2 中，加号 + 是二元运算符，它的两个操作数是值 1 和 2。

/**赋值运算符 */
/** 赋值运算符（a = b），表示用 b 的值来初始化或更新 a 的值：*/


let b2 = 10
var a2 = 5
a2 = b2
// a2 现在等于 10
//如果赋值的右边是一个多元组，它的元素可以马上被分解成多个常量或变量：

let (x2, y2) = (1, 2)
// 现在 x2 等于 1，y2 等于 2
//与 C 语言和 Objective-C 不同，Swift 的赋值操作并不返回任何值。所以以下代码是错误的：


//if x = y {
//    // 此句错误, 因为 x = y 并不返回任何值
//}

//这个特性使你无法把（==）错写成（=），由于 if x2 = y2 是错误代码，Swift 能帮你避免此类错误发生。

/** 算术运算符 */
//Swift 中所有数值类型都支持了基本的四则算术运算符：
//加法（+）
//减法（-）
//乘法（*）
//除法（/）

/*
1 + 2       // 等于 3
5 - 3       // 等于 2
2 * 3       // 等于 6
10.0 / 2.5  // 等于 4.0
*/

//与 C 语言和 Objective-C 不同的是，Swift 默认情况下不允许在数值运算中出现溢出情况。但是你可以使用 Swift 的溢出运算符来实现溢出运算（如 a &+ b）。详情参见溢出运算符。

//加法运算符也可用于 String 的拼接：
/*
"hello, " + "world"  // 等于 "hello, world"
*/


/** 求余运算符 */
//求余运算符（a % b）是计算 b 的多少倍刚刚好可以容入a，返回多出来的那部分（余数）。

/**
注意：
求余运算符（%）在其他语言也叫取模运算符。然而严格说来，我们看该运算符对负数的操作结果，「求余」比「取模」更合适些。

我们来谈谈取余是怎么回事，计算 9 % 4，你先计算出 4 的多少倍会刚好可以容入 9 中：
*/

9 % 4    // 等于 1

//为了得到 a % b 的结果，% 计算了以下等式，并输出余数作为结果：
//a = (b × 倍数) + 余数

//当倍数取最大值的时候，就会刚好可以容入 a 中。

//把 9 和 4 代入等式中，我们得 1：

/**
9 = (4 × 2) + 1
同样的方法，我们来计算 -9 % 4：

-9 % 4   // 等于 -1
把 -9 和 4 代入等式，-2 是取到的最大整数：

-9 = (4 × -2) + -1
余数是 -1。

在对负数 b 求余时，b 的符号会被忽略。这意味着 a % b 和 a % -b 的结果是相同的。
*/


/** 一元负号运算符 */
//数值的正负号可以使用前缀 -（即一元负号符）来切换：


let three1 = 3
let minusThree = -three       // minusThree 等于 -3
let plusThree = -minusThree   // plusThree 等于 3, 或 "负负3"
//一元负号符（-）写在操作数之前，中间没有空格。

/**
一元正号运算符
一元正号符（+）不做任何改变地返回操作数的值：
*/

let minusSix = -6
let alsoMinusSix = +minusSix  // alsoMinusSix 等于 -6
//虽然一元正号符什么都不会改变，但当你在使用一元负号来表达负数时，你可以使用一元正号来表达正数，如此你的代码会具有对称美。


/** 组合赋值运算符 */
//如同 C 语言，Swift 也提供把其他运算符和赋值运算（=）组合的组合赋值运算符，组合加运算（+=）是其中一个例子：

/***
表达式 a += 2 是 a = a + 2 的简写，一个组合加运算就是把加法运算和赋值运算组合成进一个运算符里，同时完成两个运算任务。

注意：
复合赋值运算没有返回值，let b = a += 2这类代码是错误。这不同于上面提到的自增和自减运算符。
*/

/** 比较运算符（Comparison Operators） */
//所有标准 C 语言中的比较运算符都可以在 Swift 中使用：

/***
等于（a == b）
不等于（a != b）
大于（a > b）
小于（a < b）
大于等于（a >= b）
小于等于（a <= b）
注意： Swift 也提供恒等（===）和不恒等（!==）这两个比较符来判断两个对象是否引用同一个对象实例。更多细节在类与结构。

每个比较运算都返回了一个标识表达式是否成立的布尔值：
*/

1 == 1   // true, 因为 1 等于 1
2 != 1   // true, 因为 2 不等于 1
2 > 1    // true, 因为 2 大于 1
1 < 2    // true, 因为 1 小于2
1 >= 1   // true, 因为 1 大于等于 1
2 <= 1   // false, 因为 2 并不小于等于 1

let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}
// 输出 "hello, world", 因为 `name` 就是等于 "world"

//关于 if 语句，请看控制流。
/**
当元组中的值可以比较时，你也可以使用这些运算符来比较它们的大小。例如，因为 Int 和 String 类型的值可以比较，所以类型为 (Int, String) 的元组也可以被比较。相反，Bool 不能被比较，也意味着存有布尔类型的元组不能被比较。

比较元组大小会按照从左到右、逐值比较的方式，直到发现有两个值不等时停止。如果所有的值都相等，那么这一对元组我们就称它们是相等的。例如：
*/

(1, "zebra") < (2, "apple")   // true，因为 1 小于 2
(3, "apple") < (3, "bird")    // true，因为 3 等于 3，但是 apple 小于 bird
(4, "dog") == (4, "dog")      // true，因为 4 等于 4，dog 等于 dog

//在上面的例子中，你可以看到，在第一行中从左到右的比较行为。因为1小于2，所以(1, "zebra")小于(2, "apple")，不管元组剩下的值如何。所以"zebra"小于"apple"没有任何影响，因为元组的比较已经被第一个元素决定了。不过，当元组的第一个元素相同时候，第二个元素将会用作比较-第二行和第三行代码就发生了这样的比较。
/**
注意：
Swift 标准库只能比较七个以内元素的元组比较函数。如果你的元组元素超过七个时，你需要自己实现比较运算符。
*/

/** 三目运算符（Ternary Conditional Operator） */
//三目运算符的特殊在于它是有三个操作数的运算符，它的形式是 问题 ? 答案 1 : 答案 2。它简洁地表达根据 问题成立与否作出二选一的操作。如果 问题 成立，返回 答案 1 的结果；反之返回 答案 2 的结果。

//三目运算符是以下代码的缩写形式：
/***
if question {
    answer1
} else {
    answer2
}
*/
//这里有个计算表格行高的例子。如果有表头，那行高应比内容高度要高出 50 点；如果没有表头，只需高出 20 点：

let contentHeight = 40
let hasHeader = true
var rowHeight = contentHeight
if hasHeader {
    rowHeight = rowHeight + 50
} else {
    rowHeight = rowHeight + 20
}
// rowHeight 现在是 90


//第一段代码例子使用了三目运算，所以一行代码就能让我们得到正确答案。这比第二段代码简洁得多，无需将 rowHeight 定义成变量，因为它的值无需在 if 语句中改变。

//三目运算提供有效率且便捷的方式来表达二选一的选择。需要注意的事，过度使用三目运算符会使简洁的代码变的难懂。我们应避免在一个组合语句中使用多个三目运算符。

/** 空合运算符（Nil Coalescing Operator）*/
//空合运算符（a ?? b）将对可选类型 a 进行空判断，如果 a 包含一个值就进行解封，否则就返回一个默认值 b。表达式 a 必须是 Optional 类型。默认值 b 的类型必须要和 a 存储值的类型保持一致。

//空合运算符是对以下代码的简短表达方法：

//a != nil ? a! : b
//上述代码使用了三目运算符。当可选类型 a 的值不为空时，进行强制解封（a!），访问 a 中的值；反之返回默认值 b。无疑空合运算符（??）提供了一种更为优雅的方式去封装条件判断和解封两种行为，显得简洁以及更具可读性。

//注意： 如果 a 为非空值（non-nil），那么值 b 将不会被计算。这也就是所谓的短路求值。

//下文例子采用空合运算符，实现了在默认颜色名和可选自定义颜色名之间抉择

let defaultColorName = "red"
var userDefinedColorName: String?   //默认值为 nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
//userDefinedColorName 的值为空，所以 colorNameToUse 的值为 "red"


/***
 userDefinedColorName 变量被定义为一个可选的 String 类型，默认值为 nil。由于 userDefinedColorName 是一个可选类型，我们可以使用空合运算符去判断其值。在上一个例子中，通过空合运算符为一个名为 colorNameToUse 的变量赋予一个字符串类型初始值。 由于 userDefinedColorName 值为空，因此表达式 userDefinedColorName ?? defaultColorName 返回 defaultColorName 的值，即 red。
 
 另一种情况，分配一个非空值（non-nil）给 userDefinedColorName，再次执行空合运算，运算结果为封包在 userDefaultColorName 中的值，而非默认值。
 
 */


//区间运算符（Range Operators
//Swift 提供了两个方便表达一个区间的值的区间运算符。
//闭区间运算符
//闭区间运算符（a...b）定义一个包含从 a 到 b（包括 a 和 b）的所有值的区间。a 的值不能超过 b。 ‌ 闭区间运算符在迭代一个区间的所有值时是非常有用的，如在 for-in 循环中：

for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}
// 1 * 5 = 5
// 2 * 5 = 10
// 3 * 5 = 15
// 4 * 5 = 20
// 5 * 5 = 25

/**半开区间运算符*/
//半开区间运算符（a..<b）定义一个从 a 到 b 但不包括 b 的区间。 之所以称为半开区间，是因为该区间包含第一个值而不包括最后的值。
//半开区间的实用性在于当你使用一个从 0 开始的列表（如数组）时，非常方便地从0数到列表的长度


let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("第 \(i + 1) 个人叫 \(names[i])")
}
// 第 1 个人叫 Anna
// 第 2 个人叫 Alex
// 第 3 个人叫 Brian
// 第 4 个人叫 Jack

/** 逻辑运算符（Logical Operators*/
//逻辑运算符的操作对象是逻辑布尔值。Swift 支持基于 C 语言的三个标准逻辑运算。
/**
逻辑非（!a）
逻辑与（a && b）
逻辑或（a || b）
逻辑非运算符
逻辑非运算符（!a）对一个布尔值取反，使得 true 变 false，false 变 true。
它是一个前置运算符，需紧跟在操作数之前，且不加空格。读作 非 a ，例子如下：
*/
/**
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}
// 输出 "ACCESS DENIED"
*/
//if !allowedEntry 语句可以读作「如果非 allowedEntry」，接下一行代码只有在「非 allowedEntry」为 true，即 allowEntry 为 false 时被执行。
//在示例代码中，小心地选择布尔常量或变量有助于代码的可读性，并且避免使用双重逻辑非运算，或混乱的逻辑语句。

/** 逻辑与运算符 */
//逻辑与运算符（a && b）表达了只有 a 和 b 的值都为 true 时，整个表达式的值才会是 true。
//只要任意一个值为 false，整个表达式的值就为 false。事实上，如果第一个值为 false，那么是不去计算第二个值的，因为它已经不可能影响整个表达式的结果了。这被称做短路计算（short-circuit evaluation）。
//以下例子，只有两个 Bool 值都为 true 的时候才允许进入 if：

let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// 输出 "ACCESS DENIED"


/** 逻辑或运算符 */
//逻辑或运算符（a || b）是一个由两个连续的 | 组成的中置运算符。它表示了两个逻辑表达式的其中一个为 true，整个表达式就为 true。

//同逻辑与运算符类似，逻辑或也是「短路计算」的，当左端的表达式为 true 时，将不计算右边的表达式了，因为它不可能改变整个表达式的值了。

//以下示例代码中，第一个布尔值（hasDoorKey）为 false，但第二个值（knowsOverridePassword）为 true，所以整个表达是 true，于是允许进入：

let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// 输出 "Welcome!"







