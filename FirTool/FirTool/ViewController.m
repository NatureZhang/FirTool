//
//  ViewController.m
//  FirTool
//
//  Created by 张东 on 16/9/1.
//  Copyright © 2016年 __Nature__. All rights reserved.
//

#import "ViewController.h"
#import "NetWorkTask.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NetWorkTask *task = [NetWorkTask shareNetWorkTask];
    
    NSDictionary *param = @{@"api_token":@"cafe568efb1cd4bcc03afb7f9bc11913"};
    [task netWorkGET:@"http://api.fir.im/apps" parameters:param progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"%@", responseObject);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
    
    NSLog(@"%@", [[UIDevice currentDevice] systemVersion]);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
