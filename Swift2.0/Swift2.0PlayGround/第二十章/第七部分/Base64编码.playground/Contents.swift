//: Playground - noun: a place where people can play

import Foundation

let pngURL = "http://www.51work6.com/template/veikei_dz_com_20130920_color/images/logo.png"

let url = NSURL(string: pngURL)
let data = NSData(contentsOfURL: url!)

let base64EncodedString = data!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.EncodingEndLineWithCarriageReturn)

print(base64EncodedString)
