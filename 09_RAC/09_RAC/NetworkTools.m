//
//  NetworkTools.m
//  09_RAC
//
//  Created by GeekerHua on 15/12/30.
//  Copyright © 2015年 GeekerHua. All rights reserved.
//

#import "NetworkTools.h"

@protocol NetworkToolsPrxy <NSObject>

// 协议中定义方法声明后,就可以直接调用。
@optional
- (NSURLSessionDataTask *)dataTaskWithHTTPMethod:(NSString *)method
                                       URLString:(NSString *)URLString
                                      parameters:(id)parameters
                                  uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgress
                                downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgress
                                         success:(void (^)(NSURLSessionDataTask *, id))success
                                         failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;

@end

@interface NetworkTools()<NetworkToolsPrxy>

@end

@implementation NetworkTools
static NetworkTools *instance;
+ (instancetype)sharedTools{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        // 设置反序列化数据格式
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    });
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}

// RAC只需要返回信号,不需要block
- (RACSignal *)request:(RequestMethod)method URLString:(NSString *)URLString parameters:(id)parmaeters{
    
    NSString *methodName = (method == GET) ? @"GET" : @"POST";
    
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [[self dataTaskWithHTTPMethod:methodName URLString:URLString parameters:parmaeters uploadProgress:nil downloadProgress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@",responseObject);
            // 发生事件后通知订阅者消息
            [subscriber sendNext:responseObject];
            // 结束订阅
            [subscriber sendCompleted];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
            [subscriber sendError:error];
        }] resume];
        
        return nil;
    }];
    
}





@end
