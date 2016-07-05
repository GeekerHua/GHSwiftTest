//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

let date = "2016-06-22T01:21:36".stringByReplacingOccurrencesOfString("T", withString: " ")

let formatStr = "yyyy-MM-dd HH:mm:ss"
let format = NSDateFormatter()
format.dateFormat = formatStr
let dd = format.dateFromString(date)
dd?.timeIntervalSince1970

dd?.timeIntervalSince1970
dd?.timeIntervalSince1970
dd?.timeIntervalSince1970


Int("1s") > Int("2")