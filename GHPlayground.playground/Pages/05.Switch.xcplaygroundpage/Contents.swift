//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

/*  OC 中Switch 的特点
    表达式必须是一个整数
    分支中创建变量需要使用“{}”来标注作用域
    每一个case 都需要 break

    Swift
    只可以使任何值
    作用域仅在case内部
    不需要break
    每一个case都需要有代码
*/

let name = "老王"
switch name {
    case "老王":
        let age  = 80
        print("hi\(age)")
    case "老李","老方":
        print("朋友")
    default:
        print("other")
}

//: [Next](@next)
