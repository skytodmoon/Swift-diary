//: Playground - noun: a place where people can play

import UIKit

//喜欢写 C 的读者可能会经常和 sizeof 打交道，不论是分配内存，I/O 操作，还是计算数组大小的时候基本都会用到。这个在 C 中定义的运算符可以作用于类型或者某个实际的变量，并返回其在内存中的尺寸 size_t (这是和平台无关的一个整数类型)。在 Cocoa 中，我们也有一部分 API 需要涉及到类型或者实例的内存尺寸，这时候就可以使用 sizeof 来计算。一个常见的用例是在从一个数组生成 NSData 的时候需要传入数据长度。因为在 Objective-C 中 sizeof 这个 C 运算符被保留了，因此我们可以直接这么做：

char bytes[] = {1, 2, 3};
NSData *data = [NSData dataWithBytes:&bytes length:sizeof(bytes)];
// <010203>
//C 中的 sizeof 有两个版本，既可以接受类型，也可以接受某个具体的值：

sizeof(int)
sizeof(a)
//与传统的 C 或者 Objective-C 里的运算符的存在形式不同，在 Swift 中，为了保证类型安全，sizeof 经过了一层包装。在 Swift 中 sizeof 不再是运算符，而是一个只能接受类型的方法。我们还可以找到一个接受具体值，并返回其尺寸的方法：sizeofValue。另外，这样个方法返回的都是看起来比较友好和直接的 Int，而不再是 size_t：

func sizeof<T>(_: T.Type) -> Int

func sizeofValue<T>(_: T) -> Int

//虽然 sizeofValue 接受的是具体值，但是它和 C 时代的接受具体值的版本的 sizeof 行为并不相同。Swift 的 sizeofValue 所返回的是这个值实际的大小，而并非其内容的大小。具体来说，如果我们在 Swift 中想表示上面的 bytes 的话，我们会将其类型写为 [CChar]。在 C 或者 Objective-C 中，对 bytes 做 sizeof 返回的是整个数组内容在内存中占据的尺寸，每个 char 为 1，而数组元素为 3，因此这个值为 3。而在 Swift 中，我们如果直接对 bytes 做 sizeofValue 操作的话，将返回 8，这其实是在 64 位系统上一个引用的长度：

// C
char bytes[] = {1, 2, 3};
sizeof(bytes);
// 3

// Swift
var bytes: [CChar] = [1,2,3]
sizeofValue(bytes)
// 8
//所以，我们不能简单地用 sizeofValue 来获取长度，而需要进行一些计算。上面的生成 NSData 的方法在 Swift 中书写的话，等效的代码应该是下面这样的：

var bytes: [CChar] = [1,2,3]
let data = NSData(bytes: &bytes, length:sizeof(CChar) * bytes.count)
//作为练习，尝试一下指出下面的代码的结果分别是什么，并尝试解释一下 ```swift enum MyEnum: UInt16 { case A = 0 case B = 1 case C = 65535 }
sizeof(UInt16) sizeof(MyEnum) sizeofValue(MyEnum.A) sizeofValue(MyEnum.A.rawValue)


