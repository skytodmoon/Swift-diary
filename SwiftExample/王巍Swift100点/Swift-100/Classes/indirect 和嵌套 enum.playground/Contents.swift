//: Playground - noun: a place where people can play

import UIKit

//在涉及到一些数据结构的经典理论和模型 (没错，就是链表，树和图) 时，我们往往会用到嵌套的类型。比如链表，在 Swift 中，我们可以这样来定义一个单向链表：

class Node<T> {
    let value: T?
    let next: Node<T>?
    
    init(value: T?, next: Node<T>?) {
        self.value = value
        self.next = next
    }
}

let list = Node(value: 1,
                next: Node(value: 2,
                    next: Node(value: 3,
                        next: Node(value: 4, next: nil))))
// 单向链表：1 -> 2 -> 3 -> 4”

//看起来还不错，但是这样的形式在表达空节点的时候并不十分理想。我们不得不借助于 nil 来表达空节点，但是事实上空节点和 nil 并不是等价的。另外，如果我们想表达一个空链表的话，要么需要把 list 设置为 Optional，要么把 Node 里的 value 以及 next 都设为 nil，这导致描述中存在歧义，我们不得不去做一些人为的约定来表述这样的情况，这在算法描述中是十分致命的。

//在 Swift 2 中，我们现在可以使用嵌套的 enum 了 -- 而这在 Swift 1.x 里是编译器所不允许的。我们用 enum 来重新定义链表结构的话，会是下面这个样子：
/*
indirect enum LinkedList<Element: Comparable> {
    case Empty
    case Node(Element, LinkedList<Element>)
}
let linkedList = LinkedList.Node(1, .Node(2, .Node(3, .Node(4, .Empty))))
// 单项链表：1 -> 2 -> 3 -> 4
 */
//在 enum 的定义中嵌套自身对于 class 这样的引用类型来说没有任何问题，但是对于像 struct 或者 enum 这样的值类型来说，普通的做法是不可行的。我们需要在定义前面加上 indirect 来提示编译器不要直接在值类型中直接嵌套。用 enum 表达链表的好处在于，我们可以清晰地表示出空节点这一定义，这在像 Swift 这样类型十分严格的语言中是很有帮助的。比如我们可以寥寥数行就轻易地实现链表节点的删除方法，在 enum 中添加：
/*
func linkedListByRemovingElement(element: Element)
    -> LinkedList<Element> {
        guard case let .Node(value, next) = self else {
            return .Empty
        }
        return value == element ?
            next : LinkedList.Node(value, next.linkedListByRemovingElement(element))
}

let result = linkedList.linkedListByRemovingElement(2)
print(result)
// 1 -> 3 -> 4
*/

