



import Foundation

//============== UnsafePointer<T> ===========
func funConstIntPointer(x: UnsafePointer<Int8>) {
    print("调用funConstIntPointer...")
    print(x.memory)
    print(x.successor().memory)
}

func funConstVoidPointer(x: UnsafePointer<Void>) {
    print("调用funConstVoidPointer...")
    print(UnsafePointer<Int8>(x).memory)//print(UnsafePointer<Float>(x).memory)
}


var myInt: Int8 = 42
var intArray:[Int8] = [23, 45, 68]
var floatArray:[Float] = [23.0, 45.0, 68.0]

funConstIntPointer(&myInt)
funConstIntPointer(intArray)
//funConstIntPointer(floatArray)  //编译错误

funConstVoidPointer(&myInt)
funConstVoidPointer(intArray)
funConstVoidPointer(floatArray)

//============== UnsafeMutablePointer<T> ===========
func funVarUnsignedIntPointer(x: UnsafeMutablePointer<UInt32>) {
    print("调用funVarUnsignedIntPointer...")
    print(x.memory)
    print(x.successor().memory)
}

func funVarVoidPointer(x: UnsafeMutablePointer<Void>) {
    print("调用funVarVoidPointer...")
    print(UnsafePointer<UInt32>(x).memory)
}

var myInt32: UInt32 = 450
var int32Array:[UInt32] = [230, 450, 80]

funVarUnsignedIntPointer(&myInt32)
funVarUnsignedIntPointer(&int32Array)

funVarVoidPointer(&myInt32)
funVarVoidPointer(&int32Array)


var p1 = UnsafeMutablePointer<UInt8>.alloc(1)
p1.initialize(10)
print(p1.memory)

//UnsafeMutablePointer转换为UnsafePointer
var p2:UnsafePointer<Int8> = UnsafePointer<Int8>(p1)
print(p2.memory)

p1.destroy()
p1.dealloc(1)
p1 = nil


//============== AutoreleasingUnsafeMutablePointer<T> ===========
func validateContent(ioValue: AutoreleasingUnsafeMutablePointer<AnyObject?>) throws {
    let error: NSError! = NSError(domain: "com.51work6", code: 0, userInfo: nil)
    if let content = ioValue.memory as? String {
        if content == "" {
            print("Content is empty...")
            throw error
        }
    } else {
        print("Content is nil...")
        throw error
    }
}

do {
    var value: AnyObject? = nil
    try validateContent(&value)
    print(value)
} catch let err as NSError  {
    print(err.localizedDescription)
}
