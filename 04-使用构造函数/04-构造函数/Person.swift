//
//  Person.swift
//  04-构造函数
//
//  Created by GeekerHua on 15/12/25.
//  Copyright © 2015年 GeekerHua. All rights reserved.
//

import UIKit

class Person: NSObject {

    // 如果没实现构造函数,会执行父类的构造函数
    // 存储型属性,没有设置初始值 -> 在构造函数中设置初始值
    // 姓名
    var name: String? // 因为是非可选的,所以要赋值
    var age: Int = 0        //使用KVC,基本数据类型必须设置初始值
    var height: Double?
    
    // 遍历构造函数
    /**
        1. 遍历参数是否合法
        2. 传递常用参数
        3. 如果条件不满足,就返回nil,只有遍历构造函数可以返回nil
        4. `指定的构造函数`不能返回nil,必须要返回一个对象
        5. 只有遍历构造函数能够调用 self.init
    */
    convenience init?(name: String, age: Int) {
        if age < 0 || age > 100 {
            return nil
        }
        self.init(dict: ["name" : name, "age": age])
    }
    
    
    init(dict: [String: AnyObject]) {
        super.init()  // 调用KVC方法之前,必须调用super.init
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forKey key: String) {
        print("key -- \(key)")
        super.setValue(value, forKey: key)
    }
    
    // 使用KVC,重写这个方法,如果没有找到对应的KEY,就不会崩掉了
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        print("-----\(key)")
    }
    
    
//    // 重载构造函数
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
    

//    override init() {
//        print("Persion init")
//        // 先给本类属性设置初始值
//        name = "zhangsan"
//        age = 10
//        // 调用父类构造方法
//        super.init()
//    }
}
