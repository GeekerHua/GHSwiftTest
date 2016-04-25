//: [Previous](@previous)

import UIKit

var str = "Hello, playground"

// 变量用var 常量用let ,自动推到，根据右侧数值，自动推到左侧类型
var x = 20
x = 30

let y = 30
//y = 30   // Error

let z = x + y
// 自己指定变量类型
let i :Double = 10
let j  = 1.5
i + j

let p :CGFloat = 20
let q  = 2.3
p + CGFloat(q)

INT8_MAX
Int8.max
INT_MAX

typealias dd = Double
let pp: dd = 23
pp + 23 + 78.88


//  类型要求严格，任何情况都不会进行隐式转换。两个值进行计算，必须是相同类型
let num1 = 1
let num2 = 1.5
let num3 = Double(num1) + num2
let num4 = num1 + Int(num2)


//: [Next](@next)
