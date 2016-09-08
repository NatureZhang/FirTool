//
//  NSDate+Convert.m
//  FirTool
//
//  Created by zhangdong on 16/9/8.
//  Copyright © 2016年 __Nature__. All rights reserved.
//

#import "NSDate+Convert.h"

@implementation NSDate (Convert)

+ (NSString *)nat_YMDHMWithTimeInterval:(NSString *)timeInterval {
    
    NSTimeInterval interval = [timeInterval doubleValue];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-M-d HH:mm";
    return [formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:interval]];
}

@end
