//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

let num = 20

/* 
    必须要有花括号，不能有其他格式
    没有非零即真，这有true/ false

*/
if num > 10 {
    print("大于10")
}

if num > 10 {print("大于10")}

// 这种省略不允许
//if num > 10
//    print("大于10")

// 必须是bool值
//if num {
//    print("哈哈")
//}

//if num != nil {
//    print("要这么写，不要写!num")
//}

// 三目与OC中一致,用的非常多，用来处理可选值
let a = 80
let b = 20
let c = a > b ? 100 : -100









//: [Next](@next)
