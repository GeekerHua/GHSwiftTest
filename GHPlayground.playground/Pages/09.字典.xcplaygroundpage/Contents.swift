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
