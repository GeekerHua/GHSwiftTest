//
//  ViewController.swift
//  05-getset
//
//  Created by GeekerHua on 15/12/30.
//  Copyright © 2015年 GeekerHua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 懒加载 ,实际上是一个闭包
    lazy var dataList: [String] = {
        print("我懒了")
        return ["张三", "李四"]
    }()
    
    // 简单写法
    lazy var list:[String] = ["zhagnsan", "lisi"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p = Person()
        p.model = "哈哈"
//        print(dataList)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print(dataList)
    }


}

