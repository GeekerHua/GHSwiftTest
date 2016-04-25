//: [Previous](@previous)

import Foundation

// 可以理解为block,但实现的远离不一样

/*  OC 中的Block
    1. 一组预先准备好的代码
    2. 需要时执行
    3. 可以当做参数传递
    OC 中的block类似于匿名函数
*/

func sum(num1 x: Int, num2 y: Int) -> Int{
    return x + y
}

sum(num1:20, num2: 20)

// Swift中变量能够直接记录函数
let sumFunc = sum
// 使用外部参数,会有提示
sumFunc(num1: 5, num2: 8)


// 闭包定义
/*
    形参,返回值,代码都定义在{}中

*/
// 最简单的闭包,如果没有参数/返回值,统统可以省略
let demoFunc = {
    print("hello")
}
demoFunc()

func sum2(num1 x: Int, num2 y: Int) -> Int{
    return x + y
}

// in 是区分函数定义和代码实现的
// 格式 {（带外部参数的形参列表）-> 返回类型 in 代码实现}
let demoFunc2 = { (num1 x: Int, num2 y: Int) -> Int in
    return x + y
}

demoFunc2(num1: 10, num2: 30)



//: [Next](@next)
