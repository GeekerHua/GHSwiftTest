//
//  ViewController.swift
//  02-闭包
//
//  Created by GeekerHua on 15/12/25.
//  Copyright © 2015年 GeekerHua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData3 { (msg) -> () in
            print("\(msg)over")
        }
        
    }
    
    func loadData3(finished: (msg: String) -> ()){
        dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
            print("网名加载中……")
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                print("主线程回调")
                // 通过闭包回调结果
                finished(msg: "我Ok了")
            })
            
        }
    }
    
    func loadData2() {
        // 尾随闭包,闭包是最后一个参数,函数的（）可以提前关闭,最后一个参数,直接使用{}代码实现
        dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
            
        }
        
        // 正常的形式,闭包最为第二个参数
        dispatch_async(dispatch_get_global_queue(0, 0),{ () -> Void in
            
        })
        
    }
    
    /*!
    加载数据
    */
    func loadData() {
        // 没有返回值,可以省略
        dispatch_async(dispatch_get_global_queue(0, 0)) {
            print("玩命加载中……\(NSThread.currentThread())")
            
            // 主线程回调
            dispatch_async(dispatch_get_main_queue(), {
                print("执行回调……\(NSThread.currentThread())")

            })
        }
    }


}

