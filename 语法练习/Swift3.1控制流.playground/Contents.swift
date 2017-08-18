//: Playground - noun: a place where people can play

import UIKit


/**============================================================================================================================================================================================
 
 **============================================================================================================================================================================================
 **============================================================================================================================================================================================
 **============================================================================================================================================================================================
 **============================================================================================================================================================================================
 **============================================================================================================================================================================================
 */

//
//For-In 循环
//While 循环
//条件语句
//控制转移语句（Control Transfer Statements）
//提前退出
//检测 API 可用性
//

/** For-In 循环 */
//你可以使用 for-in 循环来遍历一个集合中的所有元素，例如数组中的元素、数字范围或者字符串中的字符。
//以下例子使用 for-in 遍历一个数组所有元素：

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
// Hello, Anna!
// Hello, Alex!
// Hello, Brian!
// Hello, Jack!

//你也可以通过遍历一个字典来访问它的键值对。遍历字典时，字典的每项元素会以 (key, value) 元组的形式返回，你可以在 for-in 循环中使用显式的常量名称来解读 (key, value) 元组。下面的例子中，字典的键解读为常量 animalName，字典的值会被解读为常量 legCount：


let numberOfLegs = ["spider": 8, "ant": 6, "cat" :4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
// ants have 6 legs
// spiders have 8 legs
// cats have 4 legs

/***
 字典的内容本质上是无序的，遍历元素时不能保证顺序。特别地，将元素插入一个字典的顺序并不会决定它们被遍历的顺序。关于数组和字典，详情参见集合类型。
 
 for-in 循环还可以使用数字范围。下面的例子用来输出乘 5 乘法表前面一部分内容：
 
 */
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25
/**
例子中用来进行遍历的元素是使用闭区间操作符（...）表示的从 1 到 5 的数字区间。index 被赋值为闭区间中的第一个数字（1），然后循环中的语句被执行一次。在本例中，这个循环只包含一个语句，用来输出当前 index 值所对应的乘 5 乘法表的结果。该语句执行后，index 的值被更新为闭区间中的第二个数字（2），之后 print(_:separator:terminator:) 函数会再执行一次。整个过程会进行到闭区间结尾为止。

上面的例子中，index 是一个每次循环遍历开始时被自动赋值的常量。这种情况下，index 在使用前不需要声明，只需要将它包含在循环的声明中，就可以对其进行隐式声明，而无需使用 let 关键字声明。
    
如果你不需要区间序列内每一项的值，你可以使用下划线（_）替代变量名来忽略这个值：
*/

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
// 输出 "3 to the power of 10 is 59049"
/**
这个例子计算 base 这个数的 power 次幂（本例中，是 3 的 10 次幂），从 1（ 3 的 0 次幂）开始做 3 的乘法， 进行 10 次，使用 1 到 10 的闭区间循环。这个计算并不需要知道每一次循环中计数器具体的值，只需要执行了正确的循环次数即可。下划线符号 _ （替代循环中的变量）能够忽略当前值，并且不提供循环遍历时对值的访问。

在某些情况下，你可能不想使用闭区间，包括两个端点。在一个手表上每分钟绘制一个刻度线。要绘制 60 个刻度，从 0 分钟开始。使用半开区间运算符（..<）来包含下限，但不包括上限。

*/

let minutes = 60
for tickMark in 0..<minutes{
    // 每1分钟呈现一个刻度线（60次）
}
//一些用户可能在其UI中可能需要较少的刻度。他们可以每5分钟作为一个刻度。使用 stride(from:to:by:) 函数跳过不需要的标记。
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    // 每5分钟呈现一个刻度线 (0, 5, 10, 15 ... 45, 50, 55)
}
//可以在闭区间使用 stride(from:through:by:) 起到同样作用：
let hours = 12
let hoursInterval = 3
for tickMark in stride(from: 3, through: hours, by: hoursInterval) {
    // 每3小时呈现一个刻度线 (3, 6, 9, 12)
}

/** While 循环 */
//while循环会一直运行一段语句直到条件变成false。这类循环适合使用在第一次迭代前，迭代次数未知的情况下。Swift 提供两种while循环形式：

/**
while循环，每次在循环开始时计算条件是否符合；
repeat-while循环，每次在循环结束时计算条件是否符合。

While
while循环从计算一个条件开始。如果条件为true，会重复运行一段语句，直到条件变为false。
*/
//下面的例子来玩一个叫做蛇和梯子（也叫做滑道和梯子）的小游戏：

/**
游戏的规则如下：

游戏盘面包括 25 个方格，游戏目标是达到或者超过第 25 个方格；
每一轮，你通过掷一个六面体骰子来确定你移动方块的步数，移动的路线由上图中横向的虚线所示；
如果在某轮结束，你移动到了梯子的底部，可以顺着梯子爬上去；
如果在某轮结束，你移动到了蛇的头部，你会顺着蛇的身体滑下去。
游戏盘面可以使用一个Int数组来表达。数组的长度由一个finalSquare常量储存，用来初始化数组和检测最终胜利条件。游戏盘面由 26 个 Int 0 值初始化，而不是 25 个（由0到25，一共 26 个）：
*/
/**
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
//一些方格被设置成特定的值来表示有蛇或者梯子。梯子底部的方格是一个正值，使你可以向上移动，蛇头处的方格是一个负值，会让你向下移动：

board[03] = +08;
board[06] = +11;
board[09] = +09;
board[10] = +02
board[14] = -10;
board[19] = -11;
board[22] = -02;
board[24] = -08
*/

//玩家由左下角空白处编号为 0 的方格开始游戏。玩家第一次掷骰子后才会进入游戏盘面：
/**
var square = 0
var diceRoll = 0
while square < finalSquare {
    //投色子
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    //根据点数移动
    square += diceRoll
    if square < board.count {
        // 如果玩家还在棋盘上，顺着梯子爬上去或者顺着蛇滑下去
        square += board[square]
    }
}
print("Game over!")
*/

//本例中使用了最简单的方法来模拟掷骰子。 diceRoll的值并不是一个随机数，而是以0为初始值，之后每一次while循环，diceRoll的值增加 1 ，然后检测是否超出了最大值。当diceRoll的值等于 7 时，就超过了骰子的最大值，会被重置为1。所以diceRoll的取值顺序会一直是 1 ，2，3，4，5，6，1，2 等。

//掷完骰子后，玩家向前移动diceRoll个方格，如果玩家移动超过了第 25 个方格，这个时候游戏将会结束，为了应对这种情况，代码会首先判断square的值是否小于board的count属性，只有小于才会在board[square]上增加square，来向前或向后移动（遇到了梯子或者蛇）。
/**
注意：
如果没有这个检测（square < board.count），board[square]可能会越界访问board数组，导致错误。如果square等于26， 代码会去尝试访问board[26]，超过数组的长度。

当本轮while循环运行完毕，会再检测循环条件是否需要再运行一次循环。如果玩家移动到或者超过第 25 个方格，循环条件结果为false，此时游戏结束。

while 循环比较适合本例中的这种情况，因为在 while 循环开始时，我们并不知道游戏要跑多久，只有在达成指定条件时循环才会结束。

*/
/** Repeat-While */
//while循环的另外一种形式是repeat-while，它和while的区别是在判断循环条件之前，先执行一次循环的代码块。然后重复循环直到条件为false。
/**
注意：
Swift语言的repeat-while循环和其他语言中的do-while循环是类似的。
*/

//下面是 repeat-while循环的一般格式：
/**
repeat {
    statements
} while condition
*/

//还是蛇和梯子的游戏，使用repeat-while循环来替代while循环。finalSquare、board、square和diceRoll的值初始化同while循环时一样：
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0

//repeat-while的循环版本，循环中第一步就需要去检测是否在梯子或者蛇的方块上。没有梯子会让玩家直接上到第 25 个方格，所以玩家不会通过梯子直接赢得游戏。这样在循环开始时先检测是否踩在梯子或者蛇上是安全的。

//游戏开始时，玩家在第 0 个方格上，board[0]一直等于 0， 不会有什么影响：

repeat {
    // 顺着梯子爬上去或者顺着蛇滑下去
    square += board[square]
    // 掷骰子
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    // 根据点数移动
    square += diceRoll
} while square < finalSquare
print("Game over!")

/**
 检测完玩家是否踩在梯子或者蛇上之后，开始掷骰子，然后玩家向前移动diceRoll个方格，本轮循环结束。
 
 循环条件（while square < finalSquare）和while方式相同，但是只会在循环结束后进行计算。在这个游戏中，repeat-while表现得比while循环更好。repeat-while方式会在条件判断square没有超出后直接运行square += board[square]，这种方式可以去掉while版本中的数组越界判断。
 */
/** 条件语句 */
//根据特定的条件执行特定的代码通常是十分有用的。当错误发生时，你可能想运行额外的代码；或者，当值太大或太小时，向用户显示一条消息。要实现这些功能，你就需要使用条件语句。

//Swift 提供两种类型的条件语句：if语句和switch语句。通常，当条件较为简单且可能的情况很少时，使用if语句。而switch语句更适用于条件较复杂、有更多排列组合的时候。并且switch在需要用到模式匹配（pattern-matching）的情况下会更有用。
/**
If
if语句最简单的形式就是只包含一个条件，只有该条件为true时，才执行相关代码：
 */

var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}
// 输出 "It's very cold. Consider wearing a scarf."

//上面的例子会判断温度是否小于等于 32 华氏度（水的冰点）。如果是，则打印一条消息；否则，不打印任何消息，继续执行if块后面的代码。
//当然，if语句允许二选一执行，叫做else从句。也就是当条件为false时，执行 else 语句：

temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}
// 输出 "It's not that cold. Wear a t-shirt."
//显然，这两条分支中总有一条会被执行。由于温度已升至 40 华氏度，不算太冷，没必要再围围巾。因此，else分支就被触发了。
//你可以把多个if语句链接在一起，来实现更多分支：
temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}
// 输出 "It's really warm. Don't forget to wear sunscreen."

//在上面的例子中，额外的if语句用于判断是不是特别热。而最后的else语句被保留了下来，用于打印既不冷也不热时的消息。
//实际上，当不需要完整判断情况的时候，最后的else语句是可选的：
temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
}
//在这个例子中，由于既不冷也不热，所以不会触发if或else if分支，也就不会打印任何消息。


/** Switch */
//switch语句会尝试把某个值与若干个模式（pattern）进行匹配。根据第一个匹配成功的模式，switch语句会执行对应的代码。当有可能的情况较多时，通常用switch语句替换if语句。

//switch语句最简单的形式就是把某个值与一个或若干个相同类型的值作比较：




