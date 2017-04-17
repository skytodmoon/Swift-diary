//: Playground - noun: a place where people can play


import Foundation

let fileManager = NSFileManager.defaultManager()
let path = fileManager.currentDirectoryPath
print(path)

//在当前目录下创建dir1目录
let dir = path.stringByAppendingString("/dir1/dir0")

do {
    try fileManager.createDirectoryAtPath(dir, withIntermediateDirectories: true, attributes: nil)
    
    if fileManager.fileExistsAtPath(dir) {
        try fileManager.removeItemAtPath(dir)//删除dir0目录
    }
    
} catch let err as NSError {
    print(err.description)
}


