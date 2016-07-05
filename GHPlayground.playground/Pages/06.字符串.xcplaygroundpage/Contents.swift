//: [Previous](@previous)

import UIKit

let d = Double("55")


// String 是结构体,效率更高,推荐使用String,支持遍历
var str: String = "\"你好世界\""

for c in str.characters {
    print(c)
}

// 字符串拼接
let name: String?  = "老王\u{1F425}"
let age  = 20
let title  = "小菜"
let rect = CGRect(x: 0, y: 0, width: 100, height: 100)

print((name ?? "") + String(age) + title)
print("\(name ?? "") \(age) \(title) \(rect)")
print("\(name) \(age) \(title) \(rect)")


// 字符串字符数量
let testWord = "test 测试"
name?.characters.count
title.characters.count
testWord.characters.count

// 添加可扩展字符集
var word = "cafe"

print("the number of characters in \(word) is \(word.characters.count)")
// 打印输出 "the number of characters in cafe is 4"
//word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

print("the number of characters in \(word) is \(word.characters.count)")
// 打印输出 "the number of characters in café is 4”


// 真的需要格式转换
let h = 129.000023
let m: Double = 5800
let s = 8
let st = "3.600"
let timeSt = String(format: "h = %.01f: m = %.0f st = %.01f", arguments: [h,m/100,NSString(string:st).doubleValue])


let p = NSNumber(double: 148)
//let d = String(format: "￥ %.02f", p.doubleValue)
print(d)

let timeStr = "\(h):\(m):\(s)"
let timeStr1 = String(format: "%02d:%02d:%02d", arguments: [h,m,s])

String(format: "%f", arguments: [23.432])
let price: Double = 2.9
String(format:"\(price)")
var p3: String?
p3 = "33d"
Int(p3!)


let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // 需要惊叹号来获取值
possibleString

word.stringByReplacingOccurrencesOfString("fde", withString: "")
// 获取字符
word.startIndex
word.endIndex
word.characters.count
//word.removeAtIndex(word.endIndex - Index(1))

// 获取字符串最后一个字符
word[word.startIndex]
word[word.endIndex.predecessor()]
// 获取字符串指定位置的字符
word[word.startIndex.advancedBy(2)]

for index in word.characters.indices {
    print("\(word[index])")
}

NSString(string:"532.").doubleValue


// Range 变化非常大,碰到Range,最好把String转成NSString
// Range 截取字符串目前还不知道谁会写

//str.substringWithRange(3..<4)
str
str = (str as NSString).substringWithRange(NSMakeRange(1, str.characters.count-2))
str
str.substringFromIndex("你好".endIndex)



var url = "http://blog.csdn.net/hello_hwc?view?mode=list"
var filtered = url.stringByReplacingOccurrencesOfString("?", withString: "/", options: NSStringCompareOptions.LiteralSearch, range: nil)


let text = "珍贵的“北美红宝石”<br /> <br />蔓越莓也称小红莓，因果实小且生长在低矮密实的枝蔓上而难以手工采摘，通常要靠引水灌田，再用机械打落使其漂浮，方可收集。每到蔓越莓成熟的10月，各产区的“蔓越莓节”陆续登场，不仅展示了蔓越莓独具特色的采收方式，还提供了各种蔓越莓制作的食物，吸引着天南地北的游客。<br /><br />食用方法<br />1.直接食用<br />2.制作蔓越莓干面包，糕点，饼干，果汁等"

text.stringByReplacingOccurrencesOfString("<br />", withString: "\n", options: NSStringCompareOptions.LiteralSearch, range: nil)
//: [Next](@next)


// 去掉url中的没用字符

let u = "\t\nhttp://static.tongshijia.com/images/index/2016/06/03/4bb0ac2e-293b-11e6-b8d8-00163e1600b6.jpg\r\n"
let t = "sdfsdf:"
t.rangeOfString("\n")
//let u: String? = nil
let set = NSCharacterSet.whitespaceAndNewlineCharacterSet()
let result = u.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
print(result)

