# Swift笔记(四)

## Swift原生集合类型

#### 数组集合
- 小故事 *记得大学计算机老师告诉我们 “程序 = 数据结构 + 算法”,也记得学过很多数据结构的算法，数据结构的本质是一个集合，我们可以按照数据进行添加，删除，排序等集合运算，Swift提供了三种数据结构的实现，数组，Set和字典*

#### Swift中的数组集合
 - array数组是一个串有序的相同类型元素构成的集合，数组中的集合元素是有序的，可以重复出现，
 - 数组更关心元素是否有序，而不是关心是否重复

#### 数组声明和初始话

- Swift数组类型是Array，Array是结构类型，是一个一个维泛型的集合
- Foundation框架也有数组类型，NSArray。NSarray是一个类，而并非Array结构体，因此提到数组时，应该明确Swift中的Array数组，还是Foundation框架中的NSArray数组，它们之间可以通过，相互转化。
- 在声明一个Array类的时候可以使用下面语句

`var studentList1: Array<String>`

`var studentList2: [String]`

- 其中studnetList1明确指定类型为Array<String>,<String>是泛型，说明这个数组中只能存放字符串类型的数据，studnetList2变量也是一个只能存放字符串的数组。[stirng]和array<Stirng>是等价的[String]是简化写法
- 上面声明的Array还不能运行，还需要初始话；array类型往往在声明的同时初始化，

```

var studentList1: Array<String> = ["张三","李四","王五","童六"]

var studentList2: [String] = ["张三","李四","王五","童六"]

var studentList3: [String] = ["张三","李四","王五","童六"]

var studentList4: [String]()

```



- 这种语法类json中的数组一样，数组[(左中括号)开始,](右中括号)结束，之间使用,逗号进行分隔
- let声明数组。let声明数组是不可变数组，必须声明的同时进行初始化，一旦初始化，就不可以修改
- 初始化一个空数组，`var studentList2: [String]`是有区别的.var studentList2: [String]语句没有声明初始化

#### 可变数组

- var声明的数组是可变数组，如果初始话之后不再修改数组，应该声明let的，即不变的数组
- 不可变数组在访问率比可变数组(var声明的数组)要高，可变数组通过牺牲效率换取可变性，比如，当往可变数组内添加新元素的时候，数组要重新改变大小，然后重排他们的索引下标，这些都是影响性能，因此，如果你真的确定数组是不需要修改的，那么应该声明为let
- 我们可以对可变数组元素添加，插入，删除和替换等修改操作
- 例子

```
var studentList: Array<String> = ["张三","李四","王五"]

print(studentList)

studentList.append("童六")
print(studentList)

studentList += ["刘备","关羽"]
print(studentList)

studentList.insert("张飞", atIndex: studentList.count)
print(studentList)

let removeStudent = studentList.removeAtIndex(0)
print(studentList)

studentList[0] = "诸葛亮"
print(studentList)

```
- 声明并初始化数组student，分别添加元素，使用insert方法插入元素，atIndex参数插入位置，removeAtindex方法成功后执行，第一个元素会被删除，因此最好studentList输出结果没有张三

#### 可变数组

- 数组最常用的是操作遍历，就是将数组中的每一个元素取出来，进行操作或者计算，整个遍历过程和循环分不开，可以使用for-in循环进行遍历

```
var studentList: [String] = ["张三","李四","王五"]

for item in studentList {

    print(item)
}
for (index, value) in studentList.enumerate(){
    print("Item \(index + 1) : \(value)")
}

```

- 遍历数组有两种方法，它们都采用for-in语句。代码遍历适合不需要循环变量的情况，for-in可以直接从数组studentList中取出元素，然后进行打印输出。遍历适合需要循环的情况下，数组enumerate方法可以取出索引和元素

#### 字典集合

- 字典是一个非常复杂的集合，允许按照某个键访问元素，字典是由两个部分集合构成的，一个是键key集合，一个是值value集合。键集合是不能重复元素的，而值集合可以的，键和值是成对出现的
- 字典中键和值是无序的，即便添加时按照顺序添加的，当取出这些键或者值的时候，也会变得无讯，字典集合更适合通过建访问值，就像英文查字典，剑就是要查询的因为单词，而键是英文单词的翻译

#### 字典声明和初始化

- Swift字典类型是dictionary，dictionary也是结构体类型，也是一种泛型集合
- Foundation框架中也有字典类型-NSDictionary。NSDictionary是一个类，而非NSDictionary结构体，在声明一个NSDictionary类的时候可以使用

`var studentDictionary1 :Dictionary<Int,String>`

`var studentDictionary2 :[Int:String]`

- 其中，变量studentDictionary明确了类型Dicitonary，这表明键的集合是Int类型，值得集合是String类型

```
var studentDictionary1: Dictionary<Int, String> = [102:"李四",105:"王五",109:"李四"]

var studentDictionary2 = [102 : "李四",105 : "王五",109 : "李四"]

var studentDictionary3 = [102 : "李四",105 : "王五",109 : "李四"]

var studentDictionary4 = Dictionary<Int,String>()
var studentDictionary5 = [Int: String]()

```

- 这种语法就是Json中的对象格式

#### 可变字典

- 不可变字典和可变字典的关系类似于不可变数组和可变数组之间的关系，var声明的字典是可变字典，如果初始化之后不再修改字典，应该将字典声明为let，即不变的字典
- 字典元素的删除方法有两种，一种是给一个键赋值nil，这样可以删除元素，一种是通过字典removeValueForkey方法删除元素，方法返回值是要删除的值
- 字典元素替换也有两种，一种是直接给一个存在的赋值，这样新值就会替换旧值，另一种方法通过updateValue方法替换

```
var studentDictionary: Dictionary<Int, String> = [102:"李四",105:"王五",109:"李四"]

studentDictionary[110] = "懂六"

print("班级人数: \(studentDictionary.count)")

let dismissStudent = studentDictionary.removeValueForKey(102)

print("开除的学生 \(dismissStudent!)")

studentDictionary[105] = nil

studentDictionary[109] = "张三"

let replaceStudent = studentDictionary.updateValue("李四", forKey: 110)

print("被替换的学生是: \(replaceStudent)")

```

#### 字典遍历

```
var studentDictionary = [102 : "李四",105 : "王五",109 : "李四"]

print("----遍历键---")
for studentID in studentDictionary.keys {
    print("学号: \(studentID)")
}

print("----遍历键---")
for studentName in studentDictionary.values {
    print("学号: \(studentName)")
}


print("----遍历键---")
for (studentID,studentName) in studentDictionary {
    print("\(studentID): \(studentName)")
}

```

#### Set集合

- *如果数组比较，数组中的元素是有序的，可以重复出现，可以重复出现，而Set是无序的，不能重复的元素。数组强调的是有序的，Set强调是不重复的*
- *Set类型是set，set是一个结构体类型，也是一个一维泛型集合*
- *NSSet是一个类，而结构体，因此Set应该明确是set，它们之间可以通过相互转化*
- 声明一个set类型可以使用
 `Var studentLIst:Set<String>`

```
let studentList1: Set<String> = ["张三","王五","李四"]
var studentList2 = Set<String>()

var studentList3 = ["张三","王五","李四","懂六"]
var studentList4: [String] = ["张三","王五","李四","懂六"]

let studentList5: Set<String> = ["张三","王五","李四"]

if studentList1 == studentList5 {
    print("studentList1等于studentList5")
}else{
    print("studentList1不等于studentList5")
}

if studentList3 == studentList4 {
    print("studentList3等于studentList4")
}else{
    print("studentList3不等于studentList4")
}

```
- 如果两个集合元素内容一样，但初始化时元素不同，那么进行比较的时候它们会相等吗？其实是相等的，Set集合不关注元素的顺序

#### 可变Set集合

- 不可变Set集合和可变Set集合之间的关系，类似于不可变数组和可变数组之间的关系，Var声明的Set集合是可变的，如果初始话不再修改，应该将Set集合声明为let。即不变的Set集合

```
var studentList: Set<String> = ["张三","王五","李四"]
print(studentList)

let removeStudent = studentList.removeFirst()
print(studentList)
print(removeStudent)

studentList.insert("懂六")
print(studentList)

let student = "张三"
studentList.remove(student)
print(studentList)

if !studentList.contains(student){
    print("删除学生: \(student)成功")
}else{
    print("删除学生: \(studentList.count)")
}

```

#### Set集合遍历

```
var studentList: Set<String> = ["张三","王五","李四"]
print(studentList)

for item in studentList {
    print(item)
}

for (index, value) in studentList.enumerate(){
    print("Item \(index + 1) : \(value)")
}

```

#### Set集合运算

- 这个和数学稍微有关系，交集，并集，差集

```
let A: Set<String> = ["a","b","c","d"]
let B: Set<String> = ["d","c","e","f"]

print("A和B交集 = \(A.intersect(B))")
print("A和B交集 = \(A.union(B))")
print("A和B异交集 = \(A.exclusiveOr(B))")

let C = A.subtract(B)
print("A和B差集 =\(C)")

if C.isSubsetOf(A) {
    print("C是A的子集")
}
```

### 函数
##### 使用函数
- 将程序反复执行的代码封装到一个代码块中，这个代码就是数学中的函数，具有函数名，参数和返回值
- 使用函数首先要定义函数，然后在合适的地方进行调用

```
func 函数名(参数列表) -> 返回值类型{
	语句组

	return 返回值
}
```
- 在定义一个函数关键字就是`func`,函数名需要符合标识命名规范，多个参数列表之间可以用逗号隔开，在参数列表后面使用箭头指示返回值类型，返回值有单个值和多个值，多个值返回就可以使用元组类型实现，如果函数没有返回值，用`-> 返回类型`对应的，如果函数有返回值，我们需要在函数数体使用return语句计算值得返回，如果没有返回值，函数中可以省略return语句

```
func rectangleArea(width:Double,height:Double) -> Double {
    let area = width * height

    return area
}

print("长方形的面积: \(rectangleArea(320, height: 480))")

```

- rectangleArea两个Double类型的参数，分别是长方形的高宽，函数的返回值也是Double,计算返回函数的结果，调用函数的过程是通过输出语句的实现，调用函数需要指定函数名和参数值

### 传递参数
##### 使用外部参数名

- 如果我们定义的函数有很多函数，它们又具有相同的数据类型，如果没有清晰的帮助说明，调用很难知道参数是什么，其实参数`width`，`height`，是函数的一部分，但是它们只能在函数的内部使用，

```
func rectangleArea(width:Double,height:Double) -> Double {
    let area = width * height

    return area
}

print("长方形的面积: \(rectangleArea(320, height: 480))")


//修改函数名称就是外部参数

func rectangleArea(W width:Double,H height:Double) -> Double {
    let area = width * height

    return area
}

print("长方形的面积: \(rectangleArea(320, height: 480))")

```

##### 省略外部参数名

```
//使用下划线表示省略外部参数名
func rectangleArea(width:Double, _ height:Double) -> Double {
    let area = width * height

    return area
}

print("长方形的面积: \(rectangleArea(320, height: 480))")
```
- 在定义函数时第一个参数不需要使用下划线，默认第一个参数名是省略的，其他参数名想省略则需要下划线

##### 参数默认值

```
func makecoffee(type:String = "卡布奇诺") -> String {


    return "制作一杯\(type)咖啡"
}

```

- 定义makecoffee函数，可以帮助一杯咖啡，它就可以设置为默认值，在参数列表中，默认值可以跟在参数的后面，在调用的时候，如果调用者没有传递参数，则使用默认值

```
let coffee1 = makecoffee("拿铁")

let coffee2 = makecoffee()

```

##### 可变函数

Swift中函数的参数个数可以变化，它可以接受不确定数量的输入类型参数（这些参数具有相同的类型）

```
func sum(number: Double...) -> Double {
    var tolal: Double = 0

    for number in number {
        tolal += number
    }
    return tolal
}

```

#### 参数的传递引用

- 参数传递有两种方式：值类型和引用类型。值类型给函数传递的是参数的一个副本，这样在函数的调用过程中不会受到影响元素数据，引用类型是吧数据本身引用传递过去，这样在函数的调用过程中影响原始数据，只有类是引用类型，其他的数据如整型，浮点型，布尔型，字符，字符串，元祖，集合。枚举和结构体全部是指类型

```
func increment(inout value: Double, amout:Double = 1.0) {

    value += amout

}
var value: Double = 10.0

increment(&value)
print(value)

increment(&value, amout: 100.0)
print(value)
```
### 作者说明
*这控制语句内容很多，作者看到这些内容很多，其实要是练习起来的话还是有难度的，这是swift重点的开始，我这里记录了很多基础知识，希望能帮到迷茫的小伙们的指点，写的很详细，作者会认真完成和继续努力下下去这篇文章，前面是swift的开始和认识，这里我写到这里，还有好几篇文章更新和书写，更多内容请看下一期*


*文章内容说明: 这篇文章记录swift的核心基础重点内容，作者会很多的心血写好这篇文章，更多还是多加的练习，上期内容是开始，这期作者特意划分了难度界限，准备好了没有？开始讲解了*
#### 参数返回值

- 有返回值，和没有返回值

##### 无返回值
- 有的函数为了处理某一个过程，或者要返回的类型通过inout类型参数传递出来，这时可以将函数设置为无返回值，所谓无返回值，事实上是void类型，即

```
func 函数名(参数列表){
	语句组
}

func 函数名(参数列表) ->{
	语句组
}
func 函数名(参数列表) -Void{
	语句组
}
```
- 无返回值函数不需要“return 这句话的语句”，参数列表后面，没有箭头和类型，
- 示例

```
    func increment(inout value:Double, amount: Double = 1.0 ){
        value += amount
    }
    func increment(inout value:Double, amount: Double = 1.0 ) ->() {
        value += amount
    }
    func increment(inout value:Double, amount: Double = 1.0 ) ->Void {
        value += amount
    }

```
##### 多返回值函数

- 有时候需要返回多个值，这可以通过两种凡事来实现，一种是函数定义时将函数多个参数声明应用类型传递，这样当函数调用结束时，这些参数的值就变化了，另一种是返回元租类型‘

```
       func position(dt:Doule, speed:(x: Int, y: Int)) -> (x: Int, y: Int) {
        let posx: Int = speed.x * Int(dt)
        let posy: Int = speed.y * Int(dt)

        return (posx,posy)
    }

    let move = position(60.0 ,speed: (10,5))
    print{"物体位移: \(move.x), \(move.y)"

```

- 这个示例计算物体时间和速度时的位移，其中dt： Double参数是时间， x和y分别表示x轴和y轴的速度，是有方向的

##### 函数类型

- 每个函数都有一个类型，使用函数的类型和其他类型一样，可以声明变量或者常量，也可以作为其他，函数的参数或者返回值的使用

```
//定义计算长方形面积的函数
func rectangleArea(width: Double, height: Double) -> Double {

    let are  = width * height

    return area
}


//定义计算三角形面积的函数
func triangleArea(bottom: Double, height: Double) -> Double {

    let are  = 0.5 * bottom * height

    return area
}

func sayHello(){
    print("Hello world")
}

```
##### 作为函数返回类型使用

```
 //定义计算长方形面积的函数
func rectangleArea(width: Double, height: Double) -> Double {

    let area  = width * height

    return area
}


//定义计算三角形面积的函数
func triangleArea(bottom: Double, height: Double) -> Double {

    let area  = 0.5 * bottom * height

    return area
}

func getArea(type : String) -> (Double, Double) -> Double {

    var returnFunction:(Double, Double) -> Double

    switch (type) {
    case "rect":
        returnFunction = rectangleArea
    case "tria":
        returnFunction = rectangleArea
    default:
        returnFunction = rectangleArea
    }
    return returnFunction
}
//获得计算三角形面积的函数
var area : (Double, Double)-> Double = getArea("tria")
print("三角形的面积: \(area(10,15))")

//获取计算长方形面积的函数
area = getArea("rect")
print("长方形的面积: \(area(10,15))")

```

##### 作为参数类型使用


```
//定义计算长方形面积的函数
func rectangleArea(width: Double, height: Double) -> Double {

    let area  = width * height

    return area
}


//定义计算三角形面积的函数
func triangleArea(bottom: Double, height: Double) -> Double {

    let area  = 0.5 * bottom * height

    return area
}

func getAreaByFunc(funcName : (Double, Double)) -> Double, a: Double, b: Double)-> Double{
    let area = funcName(a,b)
    return area
}
//获得计算三角形面积的函数
var result : Double = getAreaByFunc(triangleArea,a: 10, b: 183)
print("三角形的面积: \(result)")

//获取计算长方形面积的函数
var result : Double = getAreaByFunc(triangleArea, 10,  183)
print("长方形的面积: \(area(10,15))")

```
- 所有示例可见，他们有相同的结果，都是使用函数类型(Double, Double)-> Double，通过该函数调用getAreaByFunc，函数类型作为函数返回类型使用，而函数作为函数的参数类型使用。其实用法都是一样的

##### 嵌套函数

```
func calculate(opr: String) -> (Int, Int) -> Int {
    //定义+函数
    func add(a: Int, b: Int) -> Int{
        return a + b
    }
    //定义-函数
    func sub(a: Int, b: Int) -> Int{
        return a - b
    }
    var result: (Int, Int) -> Int

    switch (opr) {
    case "+":
        result = add
    case "-":
        result = sub
    default:
        result = add
    }
    return result
}

let f1:(Int, Int) -> Int = calculate("+")
 print("\(f1(10 , 5))")



let f2:(Int, Int) -> Int = calculate("1")
 print("\(f2(10 , 5))")

```

## 比包

#### 比包的概念
- 在讲比包之前先看看函数，其实就是嵌套函数
- 能够将函数作为参数或返回值传递

```
func calculate(opr: String) -> (Int, Int) -> Int {

    var result : (Int, Int)-> Int

    switch (opr) {
    case "+":
        result = {
            (a: Int, b: Int) -> Int in
                return a + b
        }
    default:
        result = {
            (a: Int, b: Int) -> Int in
            return a - b
        }
    }
    return result
}

let f1:(Int, Int) -> Int = calculate("+")
print("\(f1(10 , 5))")



let f2:(Int, Int) -> Int = calculate("1")
print("\(f2(10 , 5))")

```

- 原来的嵌套函数add和sub被代替

```
{ (a: Int, b: Int) -> Int in return a + b}

{ (a: Int, b: Int) -> Int in return a - b}

```
- 比包是自包含的诺名函数代码块，可以作为表达式，函数参数和函数返回值，比包表达式的运算结果是一种函数类型

 表达式

```
{(参数列表) -> 返回值类型 in
	语句组
}

```

#### 类型推断简化

- 类型推断是Swift的强项，Swift可以根据上下文推断出参数类型和返回值类型，

```
{(a: int, b: int) -> int in

    return a + b

}
```

- 能够推断参数a和b是int类型，简化为

```
{(a, b) in  return a + b}
{a, b in  return a + b}
```

- 这种简化方式修改后为

```
func calculate(opr: String) -> (Int, Int) -> Int {

    var result : (Int, Int)-> Int

    switch (opr) {
    case "+":
        result = {(a, b) in return a + b }
    default:
        result = {
            (a, b)  in return a - b}
    }
    return result
}

let f1:(Int, Int) -> Int = calculate("+")
print("\(f1(10 , 5))")



let f2:(Int, Int) -> Int = calculate("1")
print("\(f2(10 , 5))")

```

#### 隐藏return关键字

- 如果比包内部语句只有一条语句，如return a+b等，那么这种语句都是返回语句，前面的关键字return可以省略，形式为

```
{a,b in a+b}
```
- 简化后的方式

```

func calculate(opr: String) -> (Int, Int) -> Int {

    var result : (Int, Int)-> Int

    switch (opr) {
    case "+":
        result = {(a, b) in a + b }
    default:
        result = {
            (a, b)  in  a - b}
    }
    return result
}

let f1:(Int, Int) -> Int = calculate("+")
print("\(f1(10 , 5))")



let f2:(Int, Int) -> Int = calculate("1")
print("\(f2(10 , 5))")

```

#### 省略参数名

- 使用参数名省略功能，在比包中必须省略参数列表定义，Swift能够推断出这些缩写参数的类型，参数列表省略，in关键字也需要省略
- 使用参数名省略后的示例代码

```

func calculate(opr: String) -> (Int, Int) -> Int {

    var result : (Int, Int)-> Int

    switch (opr) {
    case "+":
        result = {$0 + $1}
    default:
        result = {$0 - $1}
    }
    return result
}

let f1:(Int, Int) -> Int = calculate("+")
print("\(f1(10 , 5))")



let f2:(Int, Int) -> Int = calculate("1")
print("\(f2(10 , 5))")

```

#### 使用比包返回值

- 比包表达本质上是函数类型，是有返回值，我们可以直接表达式中使用比包的返回值
- 示例代码

```
let c1:Int = {(a: Int , b: Int) -> Int in
    return a + b
}(10,5)
print("10+5 =\(c1)")

let c2:Int = {(a: Int , b: Int) -> Int in
    return a - b
}(10,5)
print("10-5 =\(c2)")

```

- 理解比包返回值有一种技巧，就是将比包部分看成一个函数，比如上示例代码中的函数` {(a: Int , b: Int) -> Int in
    return a - b
}`,那么函数调用后面小括号的参数列表就是比包的返回值


#### 使用尾随比包

- 比包表达式可以作为函数的参数传递，如果比包表达式很长，就会影响程序的可读性。尾随比包是一个书写函数括号之后的比包表达式，函数支持将其作为最后一个参数调用

```
func calculate(opr: String, funN:(Int, Int) -> Int) {


    switch (opr) {
    case "+":
        print("10 + 5 = \(funN(10,5))")
    default:
        print("10 - 5 = \(funN(10,5))")
    }

}

calculate("+", funN: {(a: Int, b: Int) -> Int in return a + b})
calculate("+") {(a: Int, b: Int) -> Int in return a + b}
calculate("+") { $0 + $1 }

calculate("-"){
    (a: Int, b: Int) -> Int in
    return a - b
}

calculate("-"){
    $0 + $1
}

```

- 由于比包表达式不是最后一个函数，调用calculate函数就不能使用尾随比包写法了，尾随比包有时候容易被误认为函数，有一些窍门可以帮助我们判断比包还是函数，比包中往往有一个关键字，比如in 还有缩写的参数`$1,等`，这些特征在函数中是没有的

#### 捕获上下文的变量和常量

- 嵌套函数或者比包可以访问它所在上下文的变量和常量，这个过程就是捕获值
- 示例

```
func makeArray() -> (String)-> [String] {

    var ary: [String] = [String]()

    func addElement(element: String) -> [String] {
        ary.append(element)
        return ary
    }
    return addElement
}

let f1 = makeArray()
print("===f1===")
print(f1("张三"))
print(f1("李四"))
print(f1("王五"))



let f2 = makeArray()
print("===f2===")
print(f1("刘备"))
print(f1("关羽"))
print(f1("张飞"))

```
