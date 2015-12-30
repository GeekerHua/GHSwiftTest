//
//  ViewController.swift
//  04-构造函数
//
//  Created by GeekerHua on 15/12/25.
//  Copyright © 2015年 GeekerHua. All rights reserved.
//

// Swift中,默认所有的类都是全局共享的,不需要引用,是在同一个命名空间下,全局共享,默认就是项目名称
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let p = Student(name: "sdf", age: 22, no: "33")
////        let p = Student(name: "zhangsna", age: 22)
//        print(p)
//        print("\(p.name)  \(p.age) \(p.no)")
        
        
//        let p = Student(dict: ["name":"zhagnsan", "age": 18, "no": "001","xxx" : "ddd"])
        let p = Person.init(name: "张三", age: 1000)
        print("\(p?.name) \(p?.age) ")
    }
}

