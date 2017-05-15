//: Playground - noun: a place where people can play

import Foundation

let filePath = "xxx"

var err: NSError?


/*
let contents = NSString(contentsOfFile: filePath, encoding: String.Encoding.utf8, error: &err)

if err != nil {
    // 错误处理
}
*/

let filePath1 = "xxx"

do {
    let str = try NSString(contentsOfFile: filePath1, encoding: String.Encoding.utf8.rawValue)
    //    let str = try String(contentsOfFile: filePath, encoding: String.Encoding.utf8)
} catch let err as NSError {
    print(err.description)
}

//MARK: - 自定义错误类型
enum DAOError: Error {
    case noData
    case primaryKeyNull
}


do {
    //MARK: - try 访问数据表函数或方法
} catch DAOError.noData {
    print("没有数据。")
} catch DAOError.primaryKeyNull {
    print("主键为空。")
}

