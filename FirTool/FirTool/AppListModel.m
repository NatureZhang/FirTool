//
//  AppListModel.m
//  FirTool
//
//  Created by zhangdong on 16/9/8.
//  Copyright © 2016年 __Nature__. All rights reserved.
//

#import "AppListModel.h"
#import "NSDate+Convert.h"
@implementation AppListModel

+ (NSDictionary *)modelCustomPropertyMapper {
    
    return @{
             
             @"appId":@"id",
             @"bundleId":@"bundle_id",
             @"appName":@"name",
             @"iconUrl":@"icon_url",
             @"shortUrl":@"short",
             @"lastTime":@"master_release.created_at",
             @"appVersion":@"master_release.version",
             @"distributionName":@"master_release.distribution_name"
             
             };
    
}

- (NSString *)bundleId {
    
    NSArray *tmpArray = [_bundleId componentsSeparatedByString:@"."];
    NSMutableArray *tmpMuArray = [NSMutableArray arrayWithArray:tmpArray];
    [tmpMuArray removeObjectsInRange:NSMakeRange(0, 2)];
    
    return [tmpMuArray componentsJoinedByString:@"."];
}

- (NSString *)lastTimeStr {
    return [NSDate nat_YMDHMWithTimeInterval:_lastTime];
}

@end
