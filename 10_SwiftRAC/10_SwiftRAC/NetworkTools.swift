//
//  NetworkTools.swift
//  10_SwiftRAC
//
//  Created by GeekerHua on 15/12/31.
//  Copyright © 2015年 GeekerHua. All rights reserved.
//

import UIKit
import AFNetworking
import ReactiveCocoa

// Swift中枚举变化很大,可以有构造函数,可以有静态函数
enum RequestMethod: String {
    case GET = "GET"
    case POST = "POST"
}


class NetworkTools: AFHTTPSessionManager {

    static let shareTools: NetworkTools = {
        var instance = NetworkTools(baseURL: nil)

        // 设置反序列化数据类型
        instance.responseSerializer.acceptableContentTypes!.insert("text/html")
        return instance
    }()
    
    func request(method: RequestMethod, URLString: String, parameters: [String: AnyObject]?) -> RACSignal {
        
        return RACSignal.createSignal({ (subscriber) -> RACDisposable! in
            
            // 创建两个闭包,一个是成功的,一个是失败的
            let successCallBack = { (task: NSURLSessionDataTask, result: AnyObject?) -> Void in
                //将结果发送给订阅者
                subscriber.sendNext(result)
                subscriber.sendCompleted()
            }
            
            let failureCallBack = {  (task: NSURLSessionDataTask?, error: NSError) -> Void in
                subscriber.sendError(error)
            }
            
            if method == .GET{
                self.GET(URLString, parameters: parameters, success: successCallBack, failure: failureCallBack)
            } else {
                self.POST(URLString, parameters: parameters, success: successCallBack, failure: failureCallBack)

            }
//            self.GET(URLString, parameters: parameters, success: { (_, JSON) -> Void in
//
//                //将结果发送给订阅者
//                subscriber.sendNext(JSON)
//                subscriber.sendCompleted()
//                }) { (_, error) -> Void in
//                    subscriber.sendError(error)
//            }
            return nil
        })
        
    }
    
}
