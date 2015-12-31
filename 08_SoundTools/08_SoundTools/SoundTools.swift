//
//  SoundTools.swift
//  08_SoundTools
//
//  Created by GeekerHua on 15/12/30.
//  Copyright © 2015年 GeekerHua. All rights reserved.
//

import UIKit

class SoundTools: NSObject {

    // let是线程安全的,只会赋值一次
    static let sharedTools = SoundTools()
    
    
    // 仿OC写法
//    // 全局静态成员记录实力
//    static var instance: SoundTools?
//    // 手动定义token
//    static var onceToken:dispatch_once_t = 0
//    class func sharedTools() -> SoundTools {
//        dispatch_once(&onceToken) { () -> Void in
//            instance = SoundTools()
//        }
//        return instance!
//    }
    
    override init() {
        print("初始化")
    }
}

