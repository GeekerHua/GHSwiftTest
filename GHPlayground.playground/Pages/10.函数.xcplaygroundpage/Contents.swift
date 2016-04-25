//: [Previous](@previous)

import Foundation

// 格式： func 函数名(形参雷彪）-> 返回类型{  // 代码实现}
func sum(x: Int, y: Int) -> Int{
    return x + y
}

sum(10, y: 20)

// 外部参数,共外部调用的参考,保证函数语义更加清晰
// 内部参数,x,y,函数内部使用
func sum1(num1 x: Int, num2 y: Int) -> Int{
    return x + y
}
sum1(num1: 3, num2: 8)

// 返回值 -> 中间不能有分隔符

// 没有返回值的三种写法,主要是为了闭包
func demo(){
    print("哈哈")
}

func demo1() -> Void{
    print("哈哈1")
}

func demo2() -> (){
    print("哈哈2")
}
demo()
demo1()
demo2()



//: [Next](@next)
