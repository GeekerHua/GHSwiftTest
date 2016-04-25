//: [Previous](@previous)

import Foundation

// 定义字典
//key  通常是String   [key : value]
var dict = ["name" : "张三" ,"age" :18]

// var let

dict["height"] = 1.5
dict

dict["name"] = "lisi"
dict


//遍历,前边是key,后边是value
for (k,v) in dict {
    print("key \(k) , value \(v)")
}

// 字典合并
let dict2 = ["title": "老板", "name": "老王"]
// 一个一个遍历设置过去
for (k ,v) in dict2{
    dict[k] = v
}
dict
//: [Next](@next)

var  url = "http://static.tongshijia.com/images/2016/01/15/68f101f8-bb36-11e5-a8c5-00163e001f59.jpg"

if let range = url.rangeOfString("images") {
    url.replaceRange(range, with: "images/s")
}
url

let RegexPhoneAndMobile = "(^(\\d{3,4})?\\d{7,8})$|(^(\\d{3,4}-)?\\d{7,8})$|(13[0-9]{9})"

func isPhoneAndMobile(text: String) -> Bool {
    return NSPredicate(format: "SELF MATCHES %@", RegexPhoneAndMobile).evaluateWithObject(text)
}

isPhoneAndMobile("13520353557")
isPhoneAndMobile("13820353557")
isPhoneAndMobile("8432299")
isPhoneAndMobile("0371-8432299")
isPhoneAndMobile("0371-84322999")


isPhoneAndMobile("037184322999")
isPhoneAndMobile("03718432299")

isPhoneAndMobile("135-2035-3557")
