//
//  AppListModel.h
//  FirTool
//
//  Created by zhangdong on 16/9/8.
//  Copyright © 2016年 __Nature__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppListModel : NSObject

@property (nonatomic, strong) NSString *appId;
@property (nonatomic, strong) NSString *appName;
@property (nonatomic, strong) NSString *shortUrl;
@property (nonatomic, strong) NSString *iconUrl;
@property (nonatomic, strong) NSString *bundleId;
@property (nonatomic, strong) NSString *lastTime;
@property (nonatomic, strong) NSString *appVersion;
@property (nonatomic, strong) NSString *distributionName;
@end
