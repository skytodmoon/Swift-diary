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
//字符串字面量
//初始化空字符串
//字符串可变性
//字符串是值类型
//使用字符
//连接字符串和字符
//字符串插值
//Unicode
//计算字符数量
//访问和修改字符串
//比较字符串
//字符串的Unicode表示形式
//

//**字符串字面量
//您可以在您的代码中包含一段预定义的字符串值作为字符串字面量。字符串字面量是由双引号 ("") 包裹着的具有固定顺序的文本字符集。 字符串字面量可以用于为常量和变量提供初始值：

let someString = "Some string literal value"
//注意someString常量通过字符串字面量进行初始化，Swift 会推断该常量为String类型。


/** 初始化空字符串 */
//要创建一个空字符串作为初始值，可以将空的字符串字面量赋值给变量，也可以初始化一个新的String实例：

var emptyString = ""               // 空字符串字面量
var anotherEmptyString = String()  // 初始化方法
// 两个字符串均为空并等价。
//您可以通过检查其Bool类型的isEmpty属性来判断该字符串是否为空：

if emptyString.isEmpty {
    print("Nothing to see here")
}
// 打印输出："Nothing to see here"


/** 字符串可变性 */
//您可以通过将一个特定字符串分配给一个变量来对其进行修改，或者分配给一个常量来保证其不会被修改：

var variableString = "Horse"
variableString += " and carriage"
// variableString 现在为 "Horse and carriage"

/*
let constantString = "Highlander"
constantString += " and another Highlander"
// 这会报告一个编译错误 (compile-time error) - 常量字符串不可以被修改。
*/

/**
注意：
在 Objective-C 和 Cocoa 中，您需要通过选择两个不同的类(NSString和NSMutableString)来指定字符串是否可以被修改。
*/

/** 字符串是值类型*/
//Swift 的String类型是值类型。 如果您创建了一个新的字符串，那么当其进行常量、变量赋值操作，或在函数/方法中传递时，会进行值拷贝。 任何情况下，都会对已有字符串值创建新副本，并对该新副本进行传递或赋值操作。 值类型在 结构体和枚举是值类型 中进行了详细描述。

//Swift 默认字符串拷贝的方式保证了在函数/方法中传递的是字符串的值。 很明显无论该值来自于哪里，都是您独自拥有的。 您可以确信传递的字符串不会被修改，除非你自己去修改它。

//在实际编译时，Swift 编译器会优化字符串的使用，使实际的复制只发生在绝对必要的情况下，这意味着您将字符串作为值类型的同时可以获得极高的性能。
/** 使用字符*/
//您可通过for-in循环来遍历字符串中的characters属性来获取每一个字符的值：

for character in "Dog!🐶".characters {
    print(character)
}
// D
// o
// g
// !
// 🐶
//for-in循环在 For 循环 中进行了详细描述。
//另外，通过标明一个Character类型并用字符字面量进行赋值，可以建立一个独立的字符常量或变量：

let exclamationMark: Character = "!"

//字符串可以通过传递一个值类型为Character的数组作为自变量来初始化：

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
// 打印输出："Cat!🐱"


/** 连接字符串和字符 */
//字符串可以通过加法运算符（+）相加在一起（或称“连接”）创建一个新的字符串：

let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
// welcome 现在等于 "hello there"
//您也可以通过加法赋值运算符 (+=) 将一个字符串添加到一个已经存在字符串变量上：


var instruction = "look over"
instruction += string2
// instruction 现在等于 "look over there"
//您可以用append()方法将一个字符附加到一个字符串变量的尾部：
/*
let exclamationMark: Character = "!"
welcome.append(exclamationMark)
// welcome 现在等于 "hello there!"
*/

/*
注意：
您不能将一个字符串或者字符添加到一个已经存在的字符变量上，因为字符变量只能包含一个字符。
*/


//字符串插值
//字符串插值是一种构建新字符串的方式，可以在其中包含常量、变量、字面量和表达式。 您插入的字符串字面量的每一项都在以反斜线为前缀的圆括号中

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message 是 "3 times 2.5 is 7.5"

//在上面的例子中，multiplier作为\(multiplier)被插入到一个字符串常量量中。 当创建字符串执行插值计算时此占位符会被替换为multiplier实际的值。

//multiplier的值也作为字符串中后面表达式的一部分。 该表达式计算Double(multiplier) * 2.5的值并将结果 (7.5) 插入到字符串中。 在这个例子中，表达式写为\(Double(multiplier) * 2.5)并包含在字符串字面量中。
/**
注意：
插值字符串中写在括号中的表达式不能包含非转义反斜杠 (\)，并且不能包含回车或换行符。不过，插值字符串可以包含其他字面量。
*/

/** Unicode*/
//Unicode是一个国际标准，用于文本的编码和表示。 它使您可以用标准格式表示来自任意语言几乎所有的字符，并能够对文本文件或网页这样的外部资源中的字符进行读写操作。 Swift 的String和Character类型是完全兼容 Unicode 标准的。


/** Unicode 标量 */
//Swift 的String类型是基于 Unicode 标量 建立的。 Unicode 标量是对应字符或者修饰符的唯一的21位数字，例如U+0061表示小写的拉丁字母(LATIN SMALL LETTER A)("a")，U+1F425表示小鸡表情(FRONT-FACING BABY CHICK) ("🐥")。

//注意： Unicode 码位(code poing) 的范围是U+0000到U+D7FF或者U+E000到U+10FFFF。Unicode 标量不包括 Unicode 代理项(surrogate pair) 码位，其码位范围是U+D800到U+DFFF。

//注意不是所有的21位 Unicode 标量都代表一个字符，因为有一些标量是留作未来分配的。已经代表一个典型字符的标量都有自己的名字，例如上面例子中的LATIN SMALL LETTER A和FRONT-FACING BABY CHICK。


/** 字符串字面量的特殊字符 */
/** 字符串字面量可以包含以下特殊字符：*/
/*
转义字符\0(空字符)、\\(反斜线)、\t(水平制表符)、\n(换行符)、\r(回车符)、\"(双引号)、\'(单引号)。
Unicode 标量，写成\u{n}(u为小写)，其中n为任意一到八位十六进制数且可用的 Unicode 位码。
下面的代码为各种特殊字符的使用示例。 wiseWords常量包含了两个双引号。 dollarSign、blackHeart和sparklingHeart常量演示了三种不同格式的 Unicode 标量：
*/
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imageination is more important than knowledge" - Enistein
let dollarSign = "\u{24}"             // $, Unicode 标量 U+0024
let blackHeart = "\u{2665}"           // ♥, Unicode 标量 U+2665
let sparklingHeart = "\u{1F496}"      // 💖, Unicode 标量 U+1F496

/* 可扩展的字形群集 */

/***
每一个 Swift 的Character类型代表一个可扩展的字形群。 一个可扩展的字形群是一个或多个可生成人类可读的字符 Unicode 标量的有序排列。
举个例子，字母é可以用单一的 Unicode 标量é(LATIN SMALL LETTER E WITH ACUTE, 或者U+00E9)来表示。然而一个标准的字母e(LATIN SMALL LETTER E或者U+0065) 加上一个急促重音(COMBINING ACTUE ACCENT)的标量(U+0301)，这样一对标量就表示了同样的字母é。 这个急促重音的标量形象的将e转换成了é。

在这两种情况中，字母é代表了一个单一的 Swift 的Character值，同时代表了一个可扩展的字形群。 在第一种情况，这个字形群包含一个单一标量；而在第二种情况，它是包含两个标量的字形群：
*/

let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e 后面加上 ́
//可扩展的字符群集是一个灵活的方法，用许多复杂的脚本字符表示单一的Character值。 例如，来自朝鲜语字母表的韩语音节能表示为组合或分解的有序排列。 在 Swift 都会表示为同一个单一的Character值：

let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"
//可拓展的字符群集可以使包围记号(例如COMBINING ENCLOSING CIRCLE或者U+20DD)的标量包围其他 Unicode 标量，作为一个单一的Character值：

let enclosedEAcute: Character = "\u{E9}\u{20DD}"
//地域性指示符号的 Unicode 标量可以组合成一个单一的Character值，例如REGIONAL INDICATOR SYMBOL LETTER U(U+1F1FA)和REGIONAL INDICATOR SYMBOL LETTER S(U+1F1F8)：

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
// regionalIndicatorForUS 是 🇺🇸


/** 计算字符数量 */
//如果想要获得一个字符串中Character值的数量，可以使用字符串的characters属性的count属性

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")
// 打印输出 "unusualMenagerie has 40 characters"

//注意在 Swift 中，使用可拓展的字符群集作为Character值来连接或改变字符串时，并不一定会更改字符串的字符数量。
//例如，如果你用四个字符的单词cafe初始化一个新的字符串，然后添加一个COMBINING ACTUE ACCENT(U+0301)作为字符串的结尾。最终这个字符串的字符数量仍然是4，因为第四个字符是é，而不是e：

var word = "cafe"
print("the number of characters in \(word) is \(word.characters.count)")
// 打印输出 "the number of characters in cafe is 4"

word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

print("the number of characters in \(word) is \(word.characters.count)")
// 打印输出 "the number of characters in café is 4"

/**
 注意：
 可扩展的字符群集可以组成一个或者多个 Unicode 标量。这意味着不同的字符以及相同字符的不同表示方式可能需要不同数量的内存空间来存储。所以 Swift 中的字符在一个字符串中并不一定占用相同的内存空间数量。因此在没有获取字符串的可扩展的字符群的范围时候，就不能计算出字符串的字符数量。如果您正在处理一个长字符串，需要注意characters属性必须遍历全部的 Unicode 标量，来确定字符串的字符数量。
 
 另外需要注意的是通过characters属性返回的字符数量并不总是与包含相同字符的NSString的length属性相同。NSString的length属性是利用 UTF-16 表示的十六位代码单元数字，而不是 Unicode 可扩展的字符群集。
 **/

/** 访问和修改字符串 */
//你可以通过字符串的属性和方法来访问和修改它，当然也可以用下标语法完成。


/** 字符串索引 */
//每一个String值都有一个关联的索引(index)类型，String.Index，它对应着字符串中的每一个Character的位置。

//前面提到，不同的字符可能会占用不同数量的内存空间，所以要知道Character的确定位置，就必须从String开头遍历每一个 Unicode 标量直到结尾。因此，Swift 的字符串不能用整数(integer)做索引。
//使用startIndex属性可以获取一个String的第一个Character的索引。使用endIndex属性可以获取最后一个Character的后一个位置的索引。因此，endIndex属性不能作为一个字符串的有效下标。如果String是空串，startIndex和endIndex是相等的。

//通过调用 String 的 index(before:) 或 index(after:) 方法，可以立即得到前面或后面的一个索引。您还可以通过调用 index(_:offsetBy:) 方法来获取对应偏移量的索引，这种方式可以避免多次调用 index(before:) 或 index(after:) 方法。

//你可以使用下标语法来访问 String 特定索引的 Character。

let greeting1 = "Guten Tag!"
greeting1[greeting1.startIndex]
// G
greeting1[greeting1.index(before: greeting1.endIndex)]
// !
greeting1[greeting1.index(after: greeting1.startIndex)]
// u
let index = greeting1.index(greeting1.startIndex, offsetBy: 7)
greeting1[index]
// a


/* 试图获取越界索引对应的 Character，将引发一个运行时错误。*/
/***
greeting[greeting.endIndex] // error
greeting.index(after: endIndex) // error
使用 characters 属性的 indices 属性会创建一个包含全部索引的范围(Range)，用来在一个字符串中访问单个字符。
*/

for index in greeting1.characters.indices {
    print("\(greeting1[index]) ", terminator: "")
}
// 打印输出 "G u t e n T a g ! "


/** 
 注意：
 您可以使用 startIndex 和 endIndex 属性或者 index(before:) 、index(after:) 和 index(_:offsetBy:) 方法在任意一个确认的并遵循 Collection 协议的类型里面，如上文所示是使用在 String 中，您也可以使用在 Array、Dictionary 和 Set中。
 */

/** 插入和删除 */
//调用 insert(_:at:) 方法可以在一个字符串的指定索引插入一个字符，调用 insert(contentsOf:at:) 方法可以在一个字符串的指定索引插入一个段字符串。

var welcome1 = "hello"
welcome1.insert("!", at: welcome1.endIndex)
// welcome1 变量现在等于 "hello!"

welcome1.insert(contentsOf: "there".characters, at: welcome1.index(before: welcome1.endIndex))
// welcome1 变量现在等于 "hello there!"


//调用 remove(at:) 方法可以在一个字符串的指定索引删除一个字符，调用 removeSubrange(_:) 方法可以在一个字符串的指定索引删除一个子字符串

welcome1.remove(at: welcome1.index(before: welcome1.endIndex))

/**
 注意： 您可以使用 insert(_:at:)、insert(contentsOf:at:)、remove(at:) 和 removeSubrange(_:) 方法在任意一个确认的并遵循 RangeReplaceableCollection 协议的类型里面，如上文所示是使用在 String 中，您也可以使用在 Array、Dictionary 和 Set 中。
 */

/** 比较字符串 */
//Swift 提供了三种方式来比较文本值：字符串字符相等、前缀相等和后缀相等。


/** 字符串/字符相等*/
//字符串/字符可以用等于操作符(==)和不等于操作符(!=)

let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}
// 打印输出 "These two strings are considered equal"

/**
 如果两个字符串（或者两个字符）的可扩展的字形群集是标准相等的，那就认为它们是相等的。在这个情况下，即使可扩展的字形群集是有不同的 Unicode 标量构成的，只要它们有同样的语言意义和外观，就认为它们标准相等。
 
 例如，LATIN SMALL LETTER E WITH ACUTE(U+00E9)就是标准相等于LATIN SMALL LETTER E(U+0065)后面加上COMBINING ACUTE ACCENT(U+0301)。这两个字符群集都是表示字符é的有效方式，所以它们被认为是标准相等的
 */


// "Voulez-vous un café?" 使用 LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" 使用 LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}
// 打印输出 "These two strings are considered equal"

/**
 相反，英语中的LATIN CAPITAL LETTER A(U+0041，或者A)不等于俄语中的CYRILLIC CAPITAL LETTER A(U+0410，或者A)。两个字符看着是一样的，但却有不同的语言意义：
 */

let latinCapitalLetterA: Character = "\u{41}"

let cyrillicCapitalLetterA: Character = "\u{0410}"

if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent")
}
// 打印 "These two characters are not equivalent"


/** 前缀/后缀相等 */
//通过调用字符串的hasPrefix(_:)/hasSuffix(_:)方法来检查字符串是否拥有特定前缀/后缀，两个方法均接收一个String类型的参数，并返回一个布尔值。

//下面的例子以一个字符串数组表示莎士比亚话剧《罗密欧与朱丽叶》中前两场的场景位置：

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

//您可以调用hasPrefix(_:)方法来计算话剧中第一幕的场景数：

var actlSceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        actlSceneCount += 1
    }
}
print("There are \(actlSceneCount) scenes in Act 1")
// 打印输出 "There are 5 scenes in Act 1"

//相似地，您可以用hasSuffix(_:)方法来计算发生在不同地方的场景数
var mansionCount = 0
var cellCount = 1
for scene in romeoAndJuliet {
    if scene.hasPrefix("Capulet s mansion") {
        mansionCount += 1
    }else if scene.hasSuffix("Friat Lawrence cell"){
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
// 打印输出 "6 mansion scenes; 2 cell scenes"

/**
 注意：
 hasPrefix(_:)和hasSuffix(_:)方法都是在每个字符串中逐字符比较其可扩展的字符群集是否标准相等，详细描述在字符串/字符相等。
 */


/** 字符串的 Unicode 表示形式 */
//当一个 Unicode 字符串被写进文本文件或者其他储存时，字符串中的 Unicode 标量会用 Unicode 定义的几种编码格式（encoding forms）编码。每一个字符串中的小块编码都被称代码单元（code units）。这些包括 UTF-8 编码格式（编码字符串为8位的代码单元）， UTF-16 编码格式（编码字符串位16位的代码单元），以及 UTF-32 编码格式（编码字符串32位的代码单元）。

//Swift 提供了几种不同的方式来访问字符串的 Unicode 表示形式。 您可以利用for-in来对字符串进行遍历，从而以 Unicode 可扩展的字符群集的方式访问每一个Character值。 该过程在 使用字符 中进行了描述。

//另外，能够以其他三种 Unicode 兼容的方式访问字符串的值：
/**
UTF-8 代码单元集合 (利用字符串的utf8属性进行访问)
UTF-16 代码单元集合 (利用字符串的utf16属性进行访问)
21位的 Unicode 标量值集合，也就是字符串的 UTF-32 编码格式 (利用字符串的unicodeScalars属性进行访问)
下面由D,o,g,‼(DOUBLE EXCLAMATION MARK, Unicode 标量 U+203C)和🐶(DOG FACE，Unicode 标量为U+1F436)组成的字符串中的每一个字符代表着一种不同的表示：
*/
let dogString = "Dog‼🐶"


/* UTF-8 表示 */
//您可以通过遍历String的utf8属性来访问它的UTF-8表示。 其为String.UTF8View类型的属性，UTF8View是无符号8位 (UInt8) 值的集合，每一个UInt8值都是一个字符的 UTF-8 表示：

for codeUnit in dogString.utf8 {
    print("\(codeUnit)",terminator: "")
}

print("")
// 68 111 103 226 128 188 240 159 144 182

/**
 上面的例子中，前三个10进制codeUnit值 (68, 111, 103) 代表了字符D、o和 g，它们的 UTF-8 表示与 ASCII 表示相同。 接下来的三个10进制codeUnit值 (226, 128, 188) 是DOUBLE EXCLAMATION MARK的3字节 UTF-8 表示。 最后的四个codeUnit值 (240, 159, 144, 182) 是DOG FACE的4字节 UTF-8 表示。
 */


/** UTF-16 表示 */
//您可以通过遍历String的utf16属性来访问它的UTF-16表示。 其为String.UTF16View类型的属性，UTF16View是无符号16位 (UInt16) 值的集合，每一个UInt16都是一个字符的 UTF-16 表示：

for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// 68 111 103 8252 55357 56374

//同样，前三个codeUnit值 (68, 111, 103) 代表了字符D、o和g，它们的 UTF-16 代码单元和 UTF-8 完全相同（因为这些 Unicode 标量表示 ASCII 字符）。

//第四个codeUnit值 (8252) 是一个等于十六进制203C的的十进制值。这个代表了DOUBLE EXCLAMATION MARK字符的 Unicode 标量值U+203C。这个字符在 UTF-16 中可以用一个代码单元表示。

//第五和第六个codeUnit值 (55357和56374) 是DOG FACE字符的 UTF-16 表示。 第一个值为U+D83D(十进制值为55357)，第二个值为U+DC36(十进制值为56374)。


/** Unicode 标量表示 */
//您可以通过遍历String值的unicodeScalars属性来访问它的 Unicode 标量表示。 其为UnicodeScalarView类型的属性，UnicodeScalarView是UnicodeScalar类型的值的集合。 UnicodeScalar是21位的 Unicode 代码点。

//每一个UnicodeScalar拥有一个value属性，可以返回对应的21位数值，用UInt32来表示：

for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")
// 68 111 103 8252 128054


//前三个UnicodeScalar值(68, 111, 103)的value属性仍然代表字符D、o和g。 第四个codeUnit值(8252)仍然是一个等于十六进制203C的十进制值。这个代表了DOUBLE EXCLAMATION MARK字符的 Unicode 标量U+203C。

//第五个UnicodeScalar值的value属性，128054，是一个十六进制1F436的十进制表示。其等同于DOG FACE的 Unicode 标量U+1F436。

//作为查询它们的value属性的一种替代方法，每个UnicodeScalar值也可以用来构建一个新的String值，比如在字符串插值中使用：

for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
}
// D
// o
// g
// ‼
// 🐶

