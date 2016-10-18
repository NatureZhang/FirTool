//
//  AppListVC.m
//  FirTool
//
//  Created by zhangdong on 16/9/8.
//  Copyright © 2016年 __Nature__. All rights reserved.
//

#import "AppListVC.h"
#import "AppDetailVC.h"
#import "AppListCell.h"
#import "NetWorkTask.h"
#import "YYModel.h"
#import "MJRefresh.h"
#import "AppListModel.h"
#import "MBProgressHUD.h"

static NSString *cellId = @"appListCellId";
@interface AppListVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *contentTableView;
@property (nonatomic, strong) NSArray *appLists;

@end

@implementation AppListVC
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildContentView];
    [self getApplistNetWork];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - NetWorkTask

- (void)getApplistNetWork {
    
    NetWorkTask *task = [NetWorkTask shareNetWorkTask];
    
    NSDictionary *param = @{@"api_token":@"xxxxx"};
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [task netWorkGET:@"http://api.fir.im/apps" parameters:param progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        [self.contentTableView.mj_header endRefreshing];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        self.appLists = [NSArray yy_modelArrayWithClass:[AppListModel class] json:[responseObject objectForKey:@"items"]];
        [self sortAppList];
        
        if (self.appLists.count > 0) {
            [self.contentTableView reloadData];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

- (void)sortAppList {
    
    self.appLists = [_appLists sortedArrayUsingComparator:^NSComparisonResult(AppListModel* obj1, AppListModel* obj2) {
        
        NSComparisonResult result = [obj2.lastTime compare:obj1.lastTime];
        
        return result;
    }];
    
}

#pragma mark - 辅助函数

- (void)refreshHeader {
    [self getApplistNetWork];
}


#pragma mark - 布局函数

- (void)buildContentView {
    
    self.title = @"拓欣菁优应用列表";
    
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    
    self.contentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, height) style:UITableViewStylePlain];
    [self.view addSubview:self.contentTableView];
    [self.contentTableView registerNib:[UINib nibWithNibName:@"AppListCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellId];
    
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
    self.contentTableView.backgroundColor = [UIColor clearColor];
    
    self.contentTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeader)];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.appLists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AppListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    AppListModel *appModel = self.appLists[indexPath.row];
    cell.appModel = appModel;
    return cell;
}
#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    return 92;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AppListModel *appModel = self.appLists[indexPath.row];
    NSString *urlstring = [NSString stringWithFormat:@"http://fir.im/%@", appModel.shortUrl];
    
    AppDetailVC *detailVC = [[AppDetailVC alloc] init];
    detailVC.appUrl = urlstring;
    [self.navigationController pushViewController:detailVC animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
