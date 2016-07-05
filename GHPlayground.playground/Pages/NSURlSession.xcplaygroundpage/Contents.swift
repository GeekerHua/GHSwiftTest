//: [Previous](@previous)

import UIKit

func doTask2(){
    let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
    configuration.timeoutIntervalForRequest = 10 //超时时间
    configuration.requestCachePolicy = .UseProtocolCachePolicy //缓存策略
    configuration.HTTPAdditionalHeaders = ["Content-Type":"application/json"] //header 配置
    
    //更多配置详见官方文档...
    
    let defaultSession2 = NSURLSession(configuration:configuration)
    //获取data的task
    var dataTask:NSURLSessionDataTask?
    
    guard let url = NSURL(string: "http://www.baidu.com") else { return }
    let request = NSMutableURLRequest(URL: url)
    request.HTTPMethod = "get" //post put delete 等
    //还有很多可以设置  更多设置 详细 command + 点击 NSMutableURLRequest  就可以看到了
    
    dataTask = defaultSession2.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
        do {
            let dict = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableLeaves)
            print("dict = \(dict)")
        } catch {
            
        }
        
        //操作数据
        
    })
    
    dataTask?.resume() //开启任务
}
doTask2()



UIView.animateWithDuration(5, animations: {
     print("1111")
    }) { (finished) in
    print("ddddddddd")
}

