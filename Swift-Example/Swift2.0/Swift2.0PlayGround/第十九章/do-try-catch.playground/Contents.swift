//: Playground - noun: a place where people can play

import UIKit

let filePath = "xxx"

do {
    let str = try NSString(contentsOfFile: filePath, encoding: NSUTF8StringEncoding)
} catch let err as NSObject {
    print(err.description)
}
