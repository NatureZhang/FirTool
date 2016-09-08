//
//  AppDetailVC.m
//  FirTool
//
//  Created by zhangdong on 16/9/8.
//  Copyright © 2016年 __Nature__. All rights reserved.
//

#import "AppDetailVC.h"

@interface AppDetailVC ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *contentWebView;
@end

@implementation AppDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.appName;
    
    [self buildContetView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)buildContetView {
    
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    self.contentWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    [self.view addSubview:self.contentWebView];
    
    NSURL *url = [NSURL URLWithString:self.appUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.contentWebView loadRequest:request];
}

@end
