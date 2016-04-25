//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: Optional 可选的，可以有值，可以为nil
let url = NSURL(string: "www.baidu.com")
// !强行解包
// 可选项需要判断是否有值,否则直接写会报错
//let request = NSURLRequest(URL: url!)

// 更安全的用法
if url != nil{
    let request = NSURLRequest(URL: url!)
}

// if let
// 确保myUrl一定有值，才会进入分支
if let myUrl = url {
    print(myUrl)
}

var oName: String? = "张三"
var oAge: Int? = 18
// 只有两个全都是有值，才会进来
if let name = oName, age = oAge {
    print(name + String(age))
}

// ?? 操作符号
// 如果oName有值，使用oName，为nil时使用后边的替换值
let cName = oName ?? "abc"

// 常见的应用场景，表格返回数据数量,这个数组的初始化为空也变了
var dataList = [String]?()

dataList = ["zhangsna", "lisi"]

// dataList? 的？表示可以为空
let count = dataList?.count ?? 0
// 程序员承诺不为空，为nil就崩
// 每一次写！强行解包，一定要思考
let count1 = dataList!.count


//: [Next](@next)
