//
//  SoundTools.swift
//  08-soundTools
//
//  Created by GeekerHua on 15/12/30.
//  Copyright © 2015年 GeekerHua. All rights reserved.
//

import UIKit

class SoundTools: NSObject {
    // 全局静态成员记录实力
    static var instance: SoundTools?
    // 手动定义token
    static var onceToken:dispatch_once_t = 0
    class func sharedTools() -> SoundTools {
        dispatch_once(&onceToken) { () -> Void in
            instance = SoundTools()
        }
        return instance!
    }
}
