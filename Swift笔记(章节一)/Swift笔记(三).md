
# Swift笔记(三)

#### 控制语句

*作者写到这里的时候，人有点懵逼了，妈的什么鬼，前面是刚开始的介绍，我看到这里就有点犯傻了，这些东西比价多，我也是不断的更新文章和内容，每天搞得写小说一样，很多人要等着看*

- 分支语句：if switch guard
- 循环语句：while repeat-while for for-in
- 跳转语句: break continue fallthrough return throw

#### 分支语句
- 分支语句提供了一种控制机制，使程序具有了“判断能力”，能够像人类的大脑一个分析。分支语句又称为条件语句，条件语句是程序可根据某些表达式选择可执行

#### if语句
- 由if语句引导的选择结构有if结构，if-else结构和else-is三种结构
- 如果条件表达式为true就执行语句组，否则就执行if结构后面的语句，即语句是单句，也不能省略大括号

```
if 条件语句表达式{
	语句组
}
```

- if语句结构代码

```
var score = 95

if score >= 85 {
    print("你真优秀")
}

if score < 60 {
    print("你需要努力加倍学习")
}

if score >= 60 && score < 85 {
    print("你的成绩还可以，任需要继续加油")
}

```
- if-else语句
- 所有的语句都有结构体，而且结构的格式基本相同

```
if 条件语句表达式{
	语句组1
}else{
	语句组2
}

```
- 当程序执行到if语句时，先判断条件表达式;如果为true，则执行语句1，然后跳转else语句组2
- 如果条件语句表达式值为false，则直接执行语句2

```
var score = 95

if score < 60 {
    print("不及格")
}else{
    print("及格")
}
```

#### else-if 语句

- else-if结构

```
if 条件语句1{
	语句组1
}else if 条件语句表达式2{
	语句组2
}else if 条件语句表达式3{
	语句组3
}else if 条件语句表达式n{
	语句组n+1
}
```
- 可以以看出else if 实际上是if else结构的多层嵌套。它的明显特点就是在多个分支只执行一个语句组，而其他分支都不执行，所以这种结构可以用于多个判断结果的分支

```
let testscore = 76
var grade: Character

if testscore >=90 {
    grade = "A"
}else if testscore >=80 {
    grade = "B"
}else if testscore >=70 {
    grade = "C"
}else if testscore >=60 {
    grade = "D"
}else{
    grade = "F"
}
print("Grad = \(garde)")
```
- 结果为Grade = c

#### swith语句

- switch也称开关语句，它提供了分支程序结构
- switch语句只能比较离散的单个的整数变量或者常量，而在switch的switch语句可以使用整数，浮点数，字符，字符串，和元组等类型而且它的数值可以离散持续的范围
- switch语句case分支不需要显示添加break，分支执行完成会就跳出switch语句

```
switch 条件表达式{
	case 值1：
		语句组1
	case 值2：
		语句组2
	case 值3：
		语句组3
	case 判断值n：
		语句组n
	default：
		语句组n+1
}

```
- *每个case后面可以跟一个或者多个值，多个值之间用逗号分隔，每个switch必须有一个default语句，它放在所有分支后面，每个case至少有一条语句*

```
let testscore = 86
var grade: Character

switch testscore / 10 {
case 9:
    grade = "优"
case 8:
    grade = "良"
case 7,6:
    grade = "中"
default:
    grade = "差"
}
print("Grade = \(grade)")

```
- switch不仅可以比较整数类型，还可以比较浮点数和字符串类型

```
let value = 1.000
var desc: String

switch value {
case 0.0:
    desc = "最小值"
case 0.5:
    desc = "中值"
case 1.0:
    desc = "最大值"
default:
    desc = "其他值"
}
print("说明 = \(desc)")

```

```
let level = "优"
var desc: String

switch level {
case "优":
    desc = "90分以上"
case "良":
    desc = "80分~90分"
case "中":
    desc = "70分~80分"
case "差":
    desc = "低于60分"
default:
    desc = "无法判断"
}
print("说明 = \(desc)")

```

### guard语句

- guard语句是swift2.x新添加的关键字，和if类似，可以判断一个一个条件true情况下执行某语句，否则终止或跳过某个语句。它的设计目的是替换复杂的if-else语句的嵌套，可提高程序的可读性，但是guard语句必须带有else语句

```
guard 条件语句表达式else{
	跳转语句
}
语句组
```
- 当条件语句表达式为true时跳过else语句中的内容，执行语句组内容，条件表达式false时执行eles语句中的内容，跳转语句一般都是return，break，continue和throw等关键字用于guard语句，break和continue要一个循环使用guard语句

```
//定义一个Blog(博客)结构体
struct Blog {
    let name: String?
    let URL: String?
    let Author: String?
}

func isStyleBlog(blog: Blog) {
    if let blogName = blog.name {
        print("这篇博客名: \(blogName)")
    }else{
        print("这篇博客没有名字")
    }
}

func guardStyleBlog(blog: Blog) {
    guard let blogName = blog.name else {
        print("这篇博客没有名字")
        return
    }
    print("这篇博客名: \(blogName)")
}

```

- 首相定义一个Blog结构体，语句中let blogName = blog.name表达式称为"值绑定"，他做了两件事情，一是把blog.name赋值给blogName，一是判断blogName是否为空（nil表示）

```
//定义一个Blog(博客)结构体
struct Blog {
    let name: String?
    let URL: String?
    let Author: String?
}

func isLongStyleBlog(blog: Blog) {

    if let blogName = blog.name {
        print("这篇博客名: \(blogName)")

        if let blogAuthor = blog.Author {
            print("这篇博客名由\(blogAuthor)写的")

            if let blogURL = blog.URL {
                print("这篇博客名: \(blogURL)")
            }else {
                print("这篇博客没有网址!")
            }

        }else{
            print("这篇博客没有作者")
        }

    }else{
        print("这篇博客没有名字")
    }
}


func guardLongStyleBlog(blog: Blog) {

    guard let blogName = blog.name else {
        print("这篇博客没有名字!")
        return
    }
    print("这篇博客名：\(blogName)")

    guard let blogAuthor = blog.Author else {
        print("这篇博客没有作者!")
        return
    }

    print("这篇博客由：\(blogAuthor)写的")

    guard let blogURL = blog.URL else {
        print("这篇博客没有网址!")
        return
    }

    print("这篇博客网址：\(blogURL)")

}

```

### 循环语句
- 循环语句能够使代码重复执行，有四种循环结构类型：`while` `repeat-while` `for` `for-in` for和while 循环是执行之前测试循环条件，而repea-while是在执行之后测试循环条件，这就意味着for和while循环可能一次循环都未执行而repeat-whil将至少执行一次循环。for-in是for循环的变形，它是专门集合遍历而设计的
- while语句是一种判断额循环结构

```
while 循环条件 {
	语句组
}
```
- while循环没有初始化语句，循环次数是不可知的，只要循环条件满足，循环就会一直进行下去
- 代码示例

```
var i: Int64 = 0

while i * i < 100_000 {
    i++
}

print("i = \(i)")
print("i = \(i * i)")
```

- 上述代码的目的找到平方数小于100 000的最大整数，使用while循环需要注意，while循环条件语句只能写一个表达式，而且是一个布尔型表达式，那么如果循环中需要变量，就必须在whil语句之前对循环变量初始化，示例中先给i赋值为0，然后我们在循环内部必须通过语句更改循环变量的值，否则会进入死循环

### repea-while语句

- repea-while语句使用和whlie语句相识，不过repeat-while语句是判断循环条件结构

```
repeat {
	语句组
}whle 循环条件
```
- repear-while循环没有初始化语句，循环次数是不可未知的，不管循环条件是否满足，都会执行一次循环体，然哈再判断循环条件，如果条件满足则执行循环体，不满足则停止循环

```
var i: Int64 = 0

repeat {
    i++
}while i * i < 100_100

print("i = \(i)")
print("i * i = \(i * i)")
```

- 上面代码找到平方小于100 000的最大整数，输出结果也是一样的
- repea-while是为了替换do-while循环，do关键字在swift2.x中被用错误处理语句

###for语句

- for语句是应用广泛，功能强大的一种循环语句，其一般格式是

```
	for 初始化；循环条件：迭代 {
		语句组
	}
```
- 当程序执行到for语句时先执行初始话语句(其作用是用c初始化循环变量和其他变量),然后程序会查看循环条件是否满足，如果满足，则继续执行循环体迭代语句，之后再判断循环条件，因此反复，直到判断循环条件不满足跳出循环，终止语句一般改变循环条件

```
print("n  n*n")
print("_____________")

for var i = 1; i < 10; i++ {
    print("\(i) x \(i) = \(i * i)")
}
```
- 这个程序的循环部分初始化时，它给循环变量i赋值为1，每次循环都要判断i的值是否小于10，如果true则执行体，然后给i加1，因此最后结果打印1~9
- 初始化，循环条件以及迭代部分都可以空语句，三者为空的时候，相当于一个无线循环

```
var x: Int32
var y: Int32

for x = 0, y = 10; x < y; x++, y-- {
    print("(x,y) = (\(x), \(y))")
}
```

###for-in语句
- 一种遍历集合的for循环。使用for-in循环不必要按照for的标准套路编写代码，你需要提供一个集合就可以遍历

```
//假设有一个数组，原来遍历数组的方式

let numbers = [1,2,3,4,5,6,7,8,9,10]

print("------for------")

for var i = 0; i < numbers.count; i++ {
    print("Count is: \(i)")
}
```

- 采用for-in循环语句遍历

```
//假设有一个数组，原来遍历数组的方式

let numbers = [1,2,3,4,5,6,7,8,9,10]

print("------for------")

for item in numbers {
    print("Count is: \(item)")
}

```

- *items是循环变量，item之前使用var声明，它采用的是隐藏变量声明，in后面是集合实例，for-in循环语句将后面集合中的元素一一取出来，保存在item语句遍历集合的时候要简单方便很多，在for-in语句中如果需要循环变量，可以使用eumerate方法*

```
//假设有一个数组，原来遍历数组的方式

let numbers = [1,2,3,4,5,6,7,8,9,10]


for (index, element) in numbers.enumerate() {
    print("Item \(index): \(element)")
}
```
- 在for-in语句中numbers.enumerate()返回集合枚举，每一个元素元组类型(index,element）,其中index字段是一个循环变量，element字段是集合元素

###跳转语句

- 跳转语句能够改变程序的执行顺序，可以实现程序的跳转，swift一共五种跳转语句: `break` `continue` `fallthrough` `throw` `return`

### break语句

- `break`语句可以用于while repeat-while for和for-in语句循环结构，它的作用是强制退出循环结构，不执行循环结构剩余的语句
- break语句也可用于switch分支语句，但switch默认在每一个分支之后隐藏添加break，如果一定要显示break，程序运行不影响
- 在循环体中使用break语句有两种方式: 可以带标签，也可以不带标签。

`Break`           //不带标签
`bread label`     //带标签，lable是标签名

- 定义标签的时候后面需要跟一个冒号。不带标签的break语句使程序跳出所在层的循环体，而带标签的break语句使程序跳出标签的循环体

```
let numbers = [1,2,3,4,5,6,7,8,9,10]


for var i = 0; i < countElements(numbers); i++ {
    if i == 3 {
        break
    }
    print("Count is: \(i)")
}
```

- 当条件i==3满足的时执行break语句，break语句会终止循环

```
label1: for var x = 0; x < 5; x++ {
    label2: for var y = 5; y > 0; y-- {
        if y == x {
            break label1
        }
        print("(x,y) = (\(x),\(y)")
    }
}
```

- 默认情况下，break只会跳出最近的内循环，如果要跳出外循环，可以为外循环添加一个标签lable1 然后在break语句后面指定这个标签lable1，这样条件满足执行break语句的时候，晨曦就会跳出循环

### continue语句

- continue语句用来结束本次循环，跳过循环结中尚未执行的语句，接着进行终止条件的判断，以决定是否继续循环，对于for语句，在进行条件的判断前，程序还可以先执行迭代语句

`continue`   //不带标签
`continue  label`   //带标签，label是标签名

```
let numbers = [1,2,3,4,5,6,7,8,9,10]


for var i = 0; i < countElements(numbers); i++ {
    if i == 3 {
        continue
    }
    print("Count is: \(i)")
}
```
- *当条件i ==3 满足的时候执行continue语句，continue语句会终止本次循环，循环体中continue之后的语句将不再执行，接着程序进行下次循环，所以输出结果没有3*

```
//带有标签的continue语句示例
label1: for var x = 0; x < 5; x++ {
    label2: for var y = 5; y > 0; y-- {
        if y == x {
            continue label1
        }
        print("(x,y) = (\(x),\(y)")
    }
}

print("Gamer Over")
```

### fallthrough语句

- fallthrough是贯通语句，只能使用swift语句中，为了防止错误的发生，switch中的swift语句case分支默认不能贯通，即执行完一个case分支就跳出switch语句，但是凡事都有例外，如果你的算法真的需要多个case分支贯通，也可以使用fallthrough语句

```
var j = 1
var x = 4

switch x {
case 1:
    j++
case 2:
    j++
case 3:
    j++
case 4:
    j++
case 5:
    j++
default:
    j++
}
print("j = \(j)")

```

```
var j = 1
var x = 4

switch x {
case 1:
    j++
case 2:
    j++
case 3:
    j++
case 4:
    j++
    fallthrough
case 5:
    j++
    fallthrough
default:
    j++
}
print("j = \(j)")

```

- 上面两个例子可见，fallthrough就是为了贯穿case分支而设定的，或许这种语句我们用的很少，只需要知道就行

### 范围和区间运算符

- 这里介绍一下使用区间运算符描述的范围，且在定义范围的时候使用闭区间(...)和半开区间(..<)运算符。闭区间包含上下临界值; 半开区间包含下临界，但不包上临界值
- 闭区间

```
下临界<= 范围 <= 上临界
```

- 半开区间

```
下临界<= 范围 < 上临界
```

### swich中使用区间运算符

```
let testScore = 80

var grade: Character

switch testScore {
case 90...100:
    grade = "优"
case 80..<90:
    grade = "良"
case 60..<80:
    grade = "中"
case 0..<60:
    grade = "差"
default:
    grade = "无"
}

print("Grade = \(grade)")
```
- 在编程之后区间运算符和上下临界之间不能有空格，比如`0..<90`不能写成`0 ..<90` 三个点是连在一起的

```
var  student = (id: "10002", name: "李四", age: 32, ChineseScore: 80, EnglishScore: 89)
var  deac: String

switch student {
case (_,_,_, 90...100, 90...100):
    deac = "优"
case (_,_,_, 80..<90, 80..<90):
    deac = "良"
case (_,_,_, 60..<80, 60..<80):
    deac = "中"
case (_,_,_, 60..<80, 90...100),(_,_,_, 90...100, 60..<80):
    deac = "偏科"
case (_,_,_, 0..<80, 90...100),(_,_,_, 90...100, 60..<80):
    deac = "严重偏科"
default:
    deac = "无"
}

print("说明: \(deac)")
```

- *这个复杂点的代码示例首先说明一下学生组student,该元组一共有5个字段，name为姓名，age我年龄， ChineseScore语文成绩，EnglishScore英语成绩,这里示例中，比较学生之间的成绩，不比较其他字段，我们可以在case中使用下划线忽略中的字段值，switch不比较它们的值，只比较ChineseScore成绩是否属于90...100范围*



### for-in中使用区间运算符

- for-in用来遍历一个集合的，由于一个集合可以使用区间运算符表示，这样for-in语句中有时会使用区间运算

```
let numbers = [1,2,3,4,5,6,7,8,9,10]

let count = numbers.count
print("----半个开区间-----")

for i in 0..<count {
    print("第\(i + 1)个元素: \(numbers[i])")
}


print("----闭区间-----")

for i in 0...5 {
    print("第\(i + 1)个元素: \(numbers[i])")
}
```

- for-in语句中使用区间运算符，for-in语句和for语句没有太大的区别，其中i就是循环变量，count是数组的长度，这里一定要用开区间，如果是闭区间就会发生错误

### 值绑定

- *有时候在一些控制语句中可以将表达式的值临时赋值给一个常量或者变量，这些常量或者变量能够在该控制语句中使用，称为`值绑定`*
- 只绑定可以应用于 `if` , `guard` , `switch`等控制语句

### if中的值绑定

- 在if语句的"条件表达式"部分可以绑定值，这个绑定过程是先将表达式赋值给一个变量或者常量，然后判断这个值是否为nil: 如果不等于nil则绑定成功进入true分支，否则进入false分支

```
//定义一个Blog(博客)结构体
struct Blog {
    let name: String?
    let URL: String?
    let Author: String?
}

func isStyleBlog(blog: Blog) {

    if let blogName = blog.name,
        let blogURl = blog.URL,
        let blogAuthor = blog.Author {
            print("这篇博客名: \(blogName)")
            print("这篇博客名: \(blogName)")
            print("这篇博客名: \(blogName)")
    } else {
        print("这篇博客信息不完整")
    }
}

let blog1 = Blog(name: nil, URL: "www.baidu.com", Author: "Tom")
let blog2 = Blog(name: "Tony", URL: "www.baidu.com", Author: "Tony")

print("--blog1--")
isStyleBlog(blog1)

print("--blog2--")
isStyleBlog(blog2)
```

- if语句中，绑定了3个值，多个值绑定语句用逗号分割，只要有一个值绑定失败，整个结果否是false。绑定的常量`blogName` , `blogURL`和`BlogAuthor`在if语句true分支中是有效的

### guard中的值绑定

```
//定义一个Blog(博客)结构体
struct Blog {
    let name: String?
    let URL: String?
    let Author: String?
}

func guardStyleBlog(blog: Blog) {

    guard let blogName = blog.name,
        let blogURl = blog.URL,
        let blogAuthor = blog.Author else{
        print("这篇博客信息不完整")
        return
    }
    print("这篇博客名: \(blogName)")
    print("这篇博客由: \(blogAuthor)写的")
    print("这篇博客名: \(blogURl)")
}

let blog1 = Blog(name: nil, URL: "www.baidu.com", Author: "Tom")
let blog2 = Blog(name: "Tony", URL: "www.baidu.com", Author: "Tony")

print("--blog1--")
guardStyleBlog(blog1)

print("--blog2--")
guardStyleBlog(blog2)

```

### swith中的值绑定

- switch的case分支可以使用值绑定

```
var  student = (id: "10002", name: "李四", age: 32, ChineseScore: 90, EnglishScore: 91)
var  deac: String

switch student {
case (_,_, let AGE,90...100, 90...100):
    if (AGE > 30) {
        deac = "老优"
    }else{
        deac = "小优"
    }

case (_,_,_, 80..<90, 80..<90):
    deac = "良"
case (_,_,_, 60..<80, 60..<80):
    deac = "中"
case (_,_,_, 60..<80, 90...100),(_,_,_, 90...100, 60..<80):
    deac = "偏科"
case (_,_,_, 0..<80, 90...100),(_,_,_, 90...100, 60..<80):
    deac = "严重偏科"
default:
    deac = "无"
}

print("说明: \(deac)")

```
- let age 就是绑定值，我们在case中声明一个AGE常量然后在AGE常量就可以在该分支中使用

### Where语句
#### switch中使用where语句

### Where语句
#### switch中使用where语句
- switch语句中绑定至的情况下可以在case中使用where语句，进行条件过滤

```
var  student = (id: "10002", name: "李四", age: 32, ChineseScore: 90, EnglishScore: 91)
var  deac: String

switch student {
case (_,_, let age,90...100, 90...100):
    deac = "优"
case (_,_,_, 80..<90, 80..<90):
    deac = "良"
case (_,_,_, 60..<80, 60..<80):
    deac = "中"
case (_,_,_, 60..<80, 90...100),(_,_,_, 90...100, 60..<80):
    deac = "偏科"
case (_,_,_, 0..<80, 90...100),(_,_,_, 90...100, 60..<80):
    deac = "严重偏科"
default:
    deac = "无"
}

print("说明: \(deac)")

```
- *let age就是绑定值 然后我们在case后面使用where age > 20,过滤掉元组字段小于20的数据*

### for-in中使用where语句
- for-in中也可以使用where语句，它能够取出集合元素时为元素添加过滤条件

```
let numbers = [1,2,3,4,5,6,7,8,9,10]

print("----for-in-----")

for item in numbers where item > 5 {
    print("Count is: \(item)")
}
```

### guard中使用where语句

```
//定义一个Blog(博客)结构体
struct Blog {
    let name: String?
    let URL: String?
    var Author: String?
}

func guardStyleBlog(blog: Blog) {

    guard let blogName = blog.name
        where blog.Author == "Tony" && blogName == "Tony Blog" else {

            print("这篇博客信息名字")
            return
    }
    print("这篇博客名: \(blogName)")

}

let blog1 = Blog(name: nil, URL: "www.baidu.com", Author: "Tom")
let blog2 = Blog(name: "Tony", URL: "www.baidu.com", Author: "Tony")


guardStyleBlog(blog1)
guardStyleBlog(blog2)
```
