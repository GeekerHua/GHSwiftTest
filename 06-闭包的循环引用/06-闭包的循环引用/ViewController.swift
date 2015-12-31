//
//  ViewController.swift
//  06-闭包的循环引用
//
//  Created by GeekerHua on 15/12/30.
//  Copyright © 2015年 GeekerHua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var finishedCallBack: ((msg: String) ->())?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 写法1 [weak self]  不对self进行强引用,可以随时释放
        loadData { [weak self] (msg) -> () in
            // 闭包是准备的代码,要写self
            print(msg + "\(self?.view)")
        }
    
//        // 写法2 [unowned self]  会记录self的地址,但不会强引用,风险,self被释放了,就会崩溃
//        loadData { [unowned self] (msg) -> () in
//            // 闭包是准备的代码,要写self
//            print(msg + "\(self.view)")
//        }
    }
    
    func demoOC() {
        //        OC 的写法,解决循环引用
        weak var weakSelf = self
        loadData { (msg) -> () in
            // 闭包是准备的代码,要写self
            print(msg + "\(weakSelf?.view)")
        }
    }

    func loadData(finished: (msg:String) -> ()) {
        dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
            print("耗时操作")
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                finished(msg: "hello")
                self.finishedCallBack = finished
                self.working()
            })
        }
    }
    
    func working(){
        // 闭包不存在就甭
//        finishedCallBack!(msg:"hello")
        // 闭包不存在就不执行
        finishedCallBack?(msg:"hello")
    }
    
    deinit{
        print("释放了")
    }
}

