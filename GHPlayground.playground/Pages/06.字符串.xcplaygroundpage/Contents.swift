//: [Previous](@previous)

import UIKit


// String 是结构体,效率更高,推荐使用String,支持遍历
var str: String = "你好世界"

for c in str.characters {
    print(c)
}

// 字符串拼接
let name: String?  = "老王"
let age  = 20
let title  = "小菜"
let rect = CGRect(x: 0, y: 0, width: 100, height: 100)

print((name ?? "") + String(age) + title)
print("\(name ?? "") \(age) \(title) \(rect)")
print("\(name) \(age) \(title) \(rect)")

// 真的需要格式转换
let h = 9
let m = 5
let s = 8
let timeStr = "\(h):\(m):\(s)"
let timeStr1 = String(format: "%02d:%02d:%02d", arguments: [h,m,s])

// Range 变化非常大,碰到Range,最好把String转成NSString
// Range 截取字符串目前还不知道谁会写

//str.substringWithRange(<#T##aRange: Range<Index>##Range<Index>#>)
(str as NSString).substringWithRange(NSMakeRange(2, 2))

str.substringFromIndex("你好".endIndex)



//: [Next](@next)
