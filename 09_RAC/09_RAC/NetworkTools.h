//
//  NetworkTools.h
//  09_RAC
//
//  Created by GeekerHua on 15/12/30.
//  Copyright © 2015年 GeekerHua. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

typedef enum :NSUInteger{
    GET,
    POST
}RequestMethod;


@interface NetworkTools : AFHTTPSessionManager
+ (instancetype)sharedTools;
- (RACSignal *)request:(RequestMethod)method URLString:(NSString *)URLString parameters:(id)parmaeters;
@end
