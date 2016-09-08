//
//  NetWorkTask.h
//  FirTool
//
//  Created by zhangdong on 16/9/7.
//  Copyright © 2016年 __Nature__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface NetWorkTask : NSObject

+ (instancetype)shareNetWorkTask;

- (NSURLSessionDataTask *)netWorkGET:(NSString *)URLString
                          parameters:(id)parameters
                            progress:(void (^)(NSProgress *))progress
                             success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                             failure:(void (^)(NSURLSessionDataTask *task, NSError * error))failure;

@end
