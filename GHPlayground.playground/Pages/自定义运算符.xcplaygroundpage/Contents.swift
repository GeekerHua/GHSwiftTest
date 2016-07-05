//: [Previous](@previous)

import UIKit

var str = "Hello, playground"

//: [Next](@next)


var arr1 = [UIView(),UIView(),UIView(),UIView()]
var arr2 = [UIView(),UIView(),UIView(),UIView()]

// 自定义后置运算符
postfix operator +=+ {}
postfix func +=+ (inout array: [UIView]) -> [UIView] {
    array += array
    return array
}

let pp = arr1+=+