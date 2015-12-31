//
//  Student.swift
//  04-构造函数
//
//  Created by GeekerHua on 15/12/25.
//  Copyright © 2015年 GeekerHua. All rights reserved.
//

import UIKit

class Student: Person {

    var no: String?
    
    deinit {
        print("student deinit")
    }
    
//    override init(name: String, age: Int) {
//        no = "0101"
//        super.init(name: name, age: age)
//    }
//    
//    init(name: String, age: Int, no:String) {
//        self.no = no
//        super.init(name: name, age: age)
//    }
//    override init() {
//        print("student init")
//        no = "001"
//        // 现在系统会自动调用了,让代码的调用关系更加清晰
//        super.init()
//    }
}
