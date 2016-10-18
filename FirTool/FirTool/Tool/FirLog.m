//
//  FirLog.m
//  FirTool
//
//  Created by zhangdong on 16/9/12.
//  Copyright © 2016年 __Nature__. All rights reserved.
//

#import "FirLog.h"
#import "SystemInfo.h"

@implementation FirLog

+ (void)load
{
#ifdef DEBUG
    fprintf( stderr, "****************************************************************************************\n" );
    fprintf( stderr, "    											   \n" );
    fprintf( stderr, "    	copyright (c) 2014, {suning}               \n" );
    fprintf( stderr, "    	https://git.sn.com                         \n" );
    fprintf( stderr, "    										       \n" );
    
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    
    fprintf( stderr, "    	%s %s	\n", [SystemInfo platformString].UTF8String, [SystemInfo osVersion].UTF8String );
    fprintf( stderr, "    	ip: %s	\n", [SystemInfo localIPAddress].UTF8String );
    fprintf( stderr, "    	Home: %s	\n", [NSBundle mainBundle].bundlePath.UTF8String );
    fprintf( stderr, "    												\n" );
    fprintf( stderr, "****************************************************************************************\n" );
#endif
    
#endif
}

@end
