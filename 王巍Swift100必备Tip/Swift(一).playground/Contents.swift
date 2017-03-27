//柯里化(Currying)

/**
 * Swift 里可以将方法进行柯里化 (Currying)，这是也就是把接受多个参数的方法进行一些变形，使其更加灵活的方法。函数式的编程思想贯穿于 Swift 中，而函数的柯里化正是这门语言函数式特点的重要表现
 */

func addOne(num:Int) -> Int{
    return num + 1
}

func addTo(adder: Int) -> (Int) -> Int {
    return {
        num in
        return num + adder
    }
}

let addTwo = addTo(2)    // addTwo: Int -> Int
let result = addTwo(6)   // result = 8”
