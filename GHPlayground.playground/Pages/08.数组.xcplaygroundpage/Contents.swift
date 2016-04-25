//: [Previous](@previous)

import UIKit

let array = ["张三","李四"]
let array2 = ["张三",18,UIView()]
let array3 = [Int](count: 3, repeatedValue: 32)

for name in array {
    print(name)
}
// 日常开发中,类型一致的数组多
for name in array2{
    print(name)
}

// 可变 var 和不可变 let
var list = ["zhang", "lisi"]
list.append("wang")

//list.removeFirst()
//list.removeLast()

list.removeAtIndex(1)
print(list.capacity)
list.removeAll(keepCapacity: true)
//list.removeAll()
print(list.capacity)
list


// 数组容量的变化
var arrayM = [String]()
arrayM.capacity
for i in 0..<16 {
    arrayM.append("hello\(i)")
    print("索引\(i) 数组容量\(arrayM.capacity)")
}

// 定义数组并且实例化
//var arrayM2 = [Int]()

// 定义数组指定容量
var arrayM2 : [Int]
arrayM2 = [Int]()
print(arrayM2.capacity)

arrayM2 = []
arrayM2.append(33)
print(arrayM2.capacity)

// 指定数组容量,count： 指定容量： ,repeatValue： 填充内容
var arrayM3 = [Int](count: 32, repeatedValue: 0)
print(arrayM3.capacity)

// 数组的拼接
var arr1 = [1,2,3,4,5]
var arr2 = [6,7,8,9,10]
var arr3 = ["13","33"]
arr2 + arr1
arr1 += arr2
//arr1 += arr3  // 数组类型不同无法拼接


//: [Next](@next)
