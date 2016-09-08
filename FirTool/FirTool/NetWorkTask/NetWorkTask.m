//
//  NetWorkTask.m
//  FirTool
//
//  Created by zhangdong on 16/9/7.
//  Copyright © 2016年 __Nature__. All rights reserved.
//

#import "NetWorkTask.h"

@implementation NetWorkTask

NetWorkTask *task = nil;
+ (instancetype)shareNetWorkTask {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        task = [[NetWorkTask alloc] init];
    });
    
    return task;
}

- (NSURLSessionDataTask *)netWorkGET:(NSString *)URLString
                          parameters:(id)parameters
                            progress:(void (^)(NSProgress *))progress
                             success:(void (^)(NSURLSessionDataTask *, id responseObject))success
                             failure:(void (^)(NSURLSessionDataTask * , NSError * ))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSURLSessionDataTask *task = [manager GET:URLString parameters:parameters progress:progress success:success failure:failure];
    return task;
}

@end
