//: Playground - noun: a place where people can play


import Foundation

let pattern = "(\\d{2})\\-(\\d{2})\\-(\\d{4}|\\d{2})"

//dd-MM-yyyy
let aString = "['17-12-1980','20-02-1981','22-02-1981']"
let mutableString:NSMutableString = "['27-12-2014','10-06-2011','20-02-1998']"

do {
    let regex = try NSRegularExpression(pattern: pattern, options: .CaseInsensitive)
    let range = NSMakeRange(0, aString.characters.count)
    
    let newString = regex.stringByReplacingMatchesInString(aString, options: .WithoutAnchoringBounds, range: range, withTemplate: "$3-$2-$1")//yyyy-MM-dd
    print(newString)
    
    regex.replaceMatchesInString(mutableString, options: .WithoutAnchoringBounds, range: range, withTemplate: "$3-$2-$1")
    
    print(mutableString)
    
} catch let err as NSError {
    print(err.description)
}

