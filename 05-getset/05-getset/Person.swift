//
//  Person.swift
//  05-getset
//
//  Created by GeekerHua on 15/12/30.
//  Copyright © 2015年 GeekerHua. All rights reserved.
//

import UIKit

class Person: NSObject {

    // 参考代码
    private var _name:String?
    var name:String? {
        get{
            return _name
        }
        set {
            _name = newValue
        }
    }
    
    // 设置模型
    var model: String?{
        didSet {
            if let m = model {
                print("更新 UI \(m ?? "kong")")
            }
        }
    }
    
    // 只读属性  get only属性 ‘计算型属性’
    var title: String? {
        return "Mr.\(name)"
    }
}
