# Swift笔记(一)

## 前言
#####写一篇好的文章不容易，还要写好文章的每一个细节，说实话在公司白天完成工作任务，晚上有时间多的话，就打开简书写点东西，基本上没有时间变得非常少，在电脑前时间过得很快，做一个小功能的时间也许一天，也许花一周，苹果新的语言swift我都没有时间学习，这些基础东西本来是粘贴。
#####工作时间久了，人反而很懒惰，不喜欢代码，不喜欢代码的内容，实现起来就可以了，我也是这样看到swift的基础我真心是不想写，用眼睛扫一眼知道意思就可以了，然而才知道这是一种错误的观点，真的是不能偷懒，一偷懒什么都忘记了，这些swift基础我还是认真的一章一章的写，很多人问为什么不直接粘贴而非要自己手动写呢？实现效果不就好了，这种说法其实和Ctrl C Ctrl V没有什么区别，真的是要自己动手，也希望技术好友们，看过我的文章自己也跟着写一遍，改掉偷懒的习惯。也祝愿端午节快乐，好了说了这么多的废话，开始写swift基本语法了，后期章节会更新，这里提示如何查看API文档，英语不好的同学用翻译，然后粘贴到自己的文本下，每天积累一点东西，慢慢的变成一本自己的中文手册

*作者每天很辛苦，希望关注一下作者，写作截图*

![Snip20160711_1.png](http://upload-images.jianshu.io/upload_images/1754828-39d7bd4099f9b7fc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![Snip20160615_6.png](http://upload-images.jianshu.io/upload_images/1754828-ae245d5625099a59.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 简介
* Swift 语言由苹果公司在 2014 年推出，用来撰写 OS X 和 iOS 应用程序
* 2014 年，在 Apple WWDC 发布
### 历史
* 2010 年 7 月，苹果开发者工具部门总监 `Chris Lattner(克里斯·拉特纳)` 开始着手 Swift 编程语言的设计工作
* 用一年时间，完成基本架构
* Swift 大约历经 4 年的开发期，2014 年 6 月发表

### 特色

* 苹果宣称 Swift 的特点是：快速、现代、安全、互动，而且明显优于 Objective-C 语言
* 可以使用现有的 `Cocoa` 和 `Cocoa Touch` 框架
* Swift 取消了 Objective C 的指针及其他不安全访问的使用
* 舍弃 Objective C 早期应用 `Smalltalk` 的语法，全面改为句点表示法
* 提供了类似 Java 的名字空间(namespace)、泛型(generic)、运算对象重载（operator overloading）
* Swift 被简单的形容为 “没有 C 的 Objective-C”（Objective-C without the C）

### 现状

* 2015 年 2 月，苹果同时推出 Xcode 6.2 Beta 5 和 6.3 Beta，在完善 Swift 1.1的同时，推出了 Swift 1.2 测试版
* 2015 年 6 月，苹果在 WWDC 发布了 Swift 2.0 测试版，并且宣称在年底开源
* 从发布至今，苹果的每一个举措都彰显其大力推广 Swift 的决心
* Swift 当前正式版本：`1.2`，测试版本是 `2.0`
* 目前有些公司的新项目已经直接采用 Swift 开发
* 目前很多公司已经在做 Swift 的人才储备
* 应聘时，`会 Swift 开发` 无疑会增加自身筹码
* 到 2015 年底，iOS 9.0 正式发布的同时，Swift 势必大行其道！

#### swift的一些语法，基本介绍，标识符，关键字，常量，变量，表达式，注释
##### 标识符

- 变量,常量，方法，函数,枚举，结构体，类，协议等
- 区分大小写，Myname myname这两个不同的标识符
- 标识符首字符可以是下划线，或者字母，但不能是数字
- 标识符中其他字符可以是下划线，字母，或者数字


```
let _hello = "你好"

let 你好 = "你好世界"

//这里一定要使用关键字的话，就必须加上``符号
let `class` = "xxx"

var str = "Hello, playground"

print (str)

print("你好")
```

- 2mial,room#和class为非法的标识符，其中，使用中文"身高"命名的变量是合法的

### 关键字

-  声明有关的关键字：

```

Class deinit enum extension func import init inout

internal operator private public let protocol

static struct subscript var typealias

```

### 语句有关的关键字：

```
break case continue default repeat else fallthroug if

 in for defer guard do return switch where while

 表达式和类型关键字: associativty, convenience dynamic didset final get

 infix lazy left mutating none nonmutating optional override

 postfix precedence prefix protocol  required right set type

 unowned weak willset

```

##### 关键字区分大小写的，因此class和Class是不同的，也没有必要知道全部的含义，常用和下划线的关键字知道

```
`__column__  所在的列数`
`--FILe__    所在的文件名`
`__Function  所在的行数`

```

##### 这些关键字有点像宏的定义，可以动态获取当前的数据

```
func log(message: String)  {

    print("Function:\(CSSMERR_AC_FUNCTION_FAILED) COLUNM:\(__COREFOUNDATION__) FILE:\(PF_LINK) (message)")
}

log("Test")

```




## 常量
 - 在声明和初始化常量时，请在标识符的前面加上关键字let
 `let _Hello = "hello" `
 `_hello = "Hello world"`
 `_hello是let的分配的值，不能被赋值`

- 变量其实就在前面加上关键字var
`var x = 10,  y = 30`
- 在多个变量的声明中，我们也可以指定不同类型的数据
`var x = 10, y = true`
- x为整型，y为布尔值

- ===============使用var和let的说明====================
- 在开发中，var和let都可以

- 如果数据类型是引用数据类型时候，则最后声明let，let声明的引用数据类型不会改变引用，但可以改变其内容
 swift中数据类型分：值类型和引用类型，整型，浮点型，布尔型，字符串，元组，集合，枚举，和结构属于值类型，
 而类属于引用类型，。 “引用”,本质上是指向对象的指针，它是一个地址，引用类型类似于java的引用数据类型
- let 声明的引用数据类型代码

```

//定义一个Person类
class Person {

    var name: String

    var age: Int

    init (name: String, age: Int) {

        self.name = name

        self.age = age
    }
}
//实例化这个类，因为p1是该实例的引用，因此声明let，所以不能改变p1引用，但可以改变实例化的内容
let p1 = Person(name: "jack",age: 18)
//改变实例内容（改变它的age属性）
p1.age = 20

```

### 表达式
- 不指定数据类型

```
var  a1 = 10
var  a2 = 20
var a = a1 > a2 ? "a1" : "a2 "

```
*这句话的代码就是直接为变量或常亮赋值，并没有指定数据类型，因为Swift可以自动推断数据类型*

- 指定数据类型

```
var a1: Int = 10
let a2: Int = 20
var a = a1 > a2 ? "a1" : "a2"

```
*Int是为变量或者常量指定数据类型*

- 使用分号

```
var a1: Int = 10;
var a2: Int = 20
var a = a1 > a2 ? "a1" : "a2"

```

- swift语言中，一条语句结束后可以不加分号，也可以加分号，但是一种情况必须加分号，那就是多条语句
在写一行的时候，需要通过分号区别

```
var a1: Int = 10;
var a2: Int = 20;

```

- 原则上在声明变量或者常量时不要指定数据类型，因为这样非常简洁，但是有时候需要指定特殊的数据类型，对应结束后的分号；不是必须情况下也要加




### 运算符

- 一元运算符
- 算术一元运算一共有三个，`-`,`++`,`--` -a是对a取发运算，a++或a--是对表达式运算完后，再给a加一或者减一。而++a或--a是先给a加一，或减一，然后再进行表达式运算

```
var a = 12
print(-a)

var b = a++
print(b)

b = ++a
print(b)

//结果-12 12 14

```

### 二元运算符

- 二元运算符： `+`,`-`,`*`,`/`还有`%`，这些运算符整形和浮点数据都有效

```
//声明一个类型变量
var inResult = 1 + 2
print(inResult)

inResult = inResult * 2
print(inResult)

inResult = inResult - 1
print(inResult)

inResult = inResult / 2
print(inResult)

inResult = inResult + 8
inResult = inResult % 7
print(inResult)

print("-----------")

//声明一个浮点类型变量

var doubleResult = 10.0
print(doubleResult)

doubleResult = doubleResult - 1
print(doubleResult)

doubleResult = doubleResult * 2
print(doubleResult)

doubleResult = doubleResult / 2
print(doubleResult)

doubleResult = doubleResult + 8
doubleResult = doubleResult % 7
print(doubleResult)

```

### 算法赋值运算符

```
var a = 1
var b = 2
a += b
print(a)

a += b + 3
print(a)
a -= b
print(a)

a *= b
print(a)

a *= b
print(b)

a /= b
print(a)

a %= b
print(a)

```
*这些都是数学中的运算，相对比较简单这里不多介绍*



### 关系运算符

- 关系运算符是比较表达式大小关系的运算，它的结果是布尔类型，表达式成立时trut，否则就是false
一共有八种表达式

```
var value1 = 1
var value2 = 2
if value1 == value2 {
    print("value1 == value2")
}

if value1 != value2 {
    print("value1 != value2")
}

if value1 > value2 {
    print("value1 > value2")
}

if value1 < value2 {
    print("value1 < value2")
}

if value1 <= value2 {
    print("value1 <= value2")
}

let name1 = "world"
let name2 = "world"
if name1 == name2 {
    print("name1 == name2")
}

let a1 = [1,2]
let a2 = [1,2]

if a1 == a2 {
    print("a1 == a2")
}

//有错误
if a1 === a2 {
    print("a1 === a2")
}

```

- 错误原因是因为Array数组类型不是引用类型，不能使用===或者!==进行比较


### 逻辑运算符
- 逻辑运算符是布尔型变量进行运算，其结果也是布尔类型
- &&和||都具有短路计算的特点：比如x && y,如果 x 为flase 则不计算y,而对x || y,如果x为ture，则不计算y，我们看看代码就知道

```

var i = 0
var a = 10
var b = 9

if(a>b) || (i++ == 1){
    print("或运算为 真")
}else{
    print("或运算为 假")
}
print("i = \(i)")

i = 0;

if(a<b) || (i++ == 1){
    print("或运算为 真")
}else{
    print("或运算为 假")
}
print("i = \(i)")

```

- 由于(a>b)是ture ，后面的表达式(i++ ==1)不再计算，因此结果i不会加1
- 由于(a<b)为false,后面的表达式(i++ ==1)不再计算，因此结果i不会加1



## 位运算符号

- 这个运算符相对而言算是有一定的难度，本人到现在就没有弄清楚什么运算的，比较纠结，同时也希望知道的小伙们告诉我这些我这里介绍一下

- 位运算是以二进制(bit)为单位运算的，操作数和结果都是整形数据类型，位运算有几个运算符号: `&`  `|` `^` `~` `>>` `<<`

```
let a: UInt8 = 0b10110010
let b: UInt8 = 0b01011110

print("a | b = \(a | b)")
print("a & b = \(a & b)")
print("a ^ b = \(a ^ b)")
print("~a =\(~a)")

print("a >>2 = \(a >> 2)")
print("a <<2 = \(a << 2)")

let c: Int8 = -0b1100

print("c >> 2 = \(c >> 2)")
print("c << 2 = \(c << 2)")

```
- 代码就是这么多，但是很难理解

## 其他运算符
- 三元运算符(? :) 比如 `x?y:z` x y z 都是表达式
- 括号。 起到改变表达式运算顺序的作用，它的优先级最高
- 引用号. 实例调用属性，方法等操作符
- 赋值号 = 赋值是用等号运算符 进行的
- 问号? 用来声明可以类型
- 感叹号(!) 对可选类型值进行显示拆包
- is 判断某个实例是否为某种类型
- as 强调类型转换
- 箭头(->)说明函数或方法返回值类型
- 逗号运算符, 用于集合分割元素
- 冒号运算符: 用于字典集合分割"建值"对



#### *例子*

```
let score: UInt8 = 80
let result = score > 60 ? "及格" : "不及格"
print(result)

var  arr = [93,5,3,55,57]
print(arr[2])

var airports = ["TYO": "Tokyo", "DUB": "Dublin"]
```
