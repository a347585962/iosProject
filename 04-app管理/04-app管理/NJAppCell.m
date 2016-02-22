//
//  NJAppCell.m
//  04-app管理
//
//  Created by 李南江 on 14-4-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJAppCell.h"
#import "NJApp.h"

@interface NJAppCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UIButton *downloadView;
@property (weak, nonatomic) IBOutlet UILabel *introView;
- (IBAction)downloadClick;

@end

@implementation NJAppCell

- (void)setApp:(NJApp *)app
{
    _app = app;
    
    self.iconView.image = [UIImage imageNamed:app.icon];
    self.nameView.text = app.name;
    self.introView.text = [NSString stringWithFormat:@"大小:%@ | 下载量:%@", app.size, app.download];
    
    self.downloadView.enabled = !app.isDownloaded;
}

- (IBAction)downloadClick {
    // 1.按钮失效
    self.downloadView.enabled = NO;
    self.app.downloaded = YES;
    
    // 2.通知代理
    if ([self.delegate respondsToSelector:@selector(appCellDidClickedDownloadBtn:)]) {
        [self.delegate appCellDidClickedDownloadBtn:self];
    }
}
@end
