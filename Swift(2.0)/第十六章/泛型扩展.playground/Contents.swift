

//==========泛型队列==============
struct Queue<T> {
    
    var items = [T]()
    
    mutating func queue(item: T) {
        items.append(item)
    }
    
    mutating func dequeue() -> T? {
        if items.isEmpty {
            return nil
        } else {
            return items.removeAtIndex(0)
        }
    }
}

//==========泛型扩展==============
extension Queue {
    func peek(position: Int) -> T? {
        if position < 0 || position > items.count {
            return nil
        } else {
            return items[position]
        }
    }
}

var genericDoubleQueue = Queue<Double>()
genericDoubleQueue.queue(3.26)
genericDoubleQueue.queue(8.86)
genericDoubleQueue.queue(1.99)
genericDoubleQueue.queue(7.68)

print(genericDoubleQueue.peek(2)!)

import CoreFoundation
import Foundation

var cfstr1: CFString = "Hello,World"

var str: String = cfstr1 as String

var cfstr2: CFString = str

let any: CFTypeRef = 234

let number: Int = any as! Int



