//: Playground - noun: a place where people can play

import UIKit

//自定义错误类型
enum DAOError: ErrorType {
    case NoData
    case PrimaryKeyNull
}


do {
    //try 访问数据表函数或方法
} catch DAOError.NoData {
    print("没有数据。")
} catch DAOError.PrimaryKeyNull {
    print("主键为空。")
}


