//
//  ViewController.swift
//  07-网络
//
//  Created by GeekerHua on 15/12/30.
//  Copyright © 2015年 GeekerHua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
    }


    func loadData(){
        
    
        let jsonString = "wang"
        let jsonData = jsonString.dataUsingEncoding(NSUTF8StringEncoding)!
        
        // 强行try,如果有错误,就崩溃了
//        let result = try! NSJSONSerialization.JSONObjectWithData(jsonData, options: [])
        // try catch 抛出异常,防止反序列化失败崩溃
        do{
            let result = try NSJSONSerialization.JSONObjectWithData(jsonData, options: [])
            print(result)
        } catch {
            print(error)
        }
    }
}

