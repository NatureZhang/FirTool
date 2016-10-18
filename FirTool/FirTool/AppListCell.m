//
//  AppListCell.m
//  FirTool
//
//  Created by zhangdong on 16/9/8.
//  Copyright © 2016年 __Nature__. All rights reserved.
//

#import "AppListCell.h"
#import "UIImageView+WebCache.h"

@interface AppListCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *appNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bundleIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation AppListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.iconImage.layer.masksToBounds = YES;
    self.iconImage.layer.cornerRadius = 10;
}

- (void)setAppModel:(AppListModel *)appModel {
    
    NSURL *imageUrl = [NSURL URLWithString:appModel.iconUrl];
    [self.iconImage sd_setImageWithURL:imageUrl placeholderImage:nil];
    
    self.appNameLabel.text = [NSString stringWithFormat:@"%@", appModel.appName];
    
    self.bundleIdLabel.text = [NSString stringWithFormat:@"id: %@", appModel.bundleId];
    
    self.timeLabel.text = [NSString stringWithFormat:@"time: %@", appModel.lastTimeStr];
}

@end
