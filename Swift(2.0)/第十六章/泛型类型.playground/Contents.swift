



//============字符串队列============
struct StringQueue {
    
    var items = [String]()
    
    mutating func queue(item: String) {
        items.append(item)
    }
    
    mutating func dequeue() -> String? {
        if items.isEmpty {
            return nil
        } else {
            return items.removeAtIndex(0)
        }
    }
}

var strQueue = StringQueue()
strQueue.queue("张三")
strQueue.queue("李四")
strQueue.queue("王五")
strQueue.queue("董六")

print(strQueue.dequeue()!)
print(strQueue.dequeue()!)
print(strQueue.dequeue()!)
print(strQueue.dequeue()!)

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

var genericQueue = Queue<Int>()
genericQueue.queue(3)
genericQueue.queue(6)
genericQueue.queue(1)
genericQueue.queue(8)

print(genericQueue.dequeue()!)
print(genericQueue.dequeue()!)
print(genericQueue.dequeue()!)
print(genericQueue.dequeue()!)
