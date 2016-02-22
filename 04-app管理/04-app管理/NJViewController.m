//
//  NJViewController.m
//  04-app管理
//
//  Created by 李南江 on 14-4-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJViewController.h"
#import "NJAppCell.h"
#import "NJApp.h"

@interface NJViewController () <MJAppCellDelegate>
@property (strong, nonatomic) NSArray *apps;
@end

@implementation NJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (NSArray *)apps
{
    if (_apps == nil) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"apps_full.plist" ofType:nil]];
        
        NSMutableArray *appArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            NJApp *app = [NJApp appWithDict:dict];
            [appArray addObject:app];
        }
        _apps = appArray;
    }
    return _apps;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.apps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NJAppCell *cell = [tableView dequeueReusableCellWithIdentifier:@"app"];
    cell.delegate = self;
    cell.app = self.apps[indexPath.row];
    return cell;
}

- (void)appCellDidClickedDownloadBtn:(NJAppCell *)cell
{
    // 1.取出模型
    NJApp *app = cell.app;
    
    // 2.添加标签
    UILabel *label = [[UILabel alloc] init];
    label.text = [NSString stringWithFormat:@"成功下载%@", app.name];
    label.font = [UIFont systemFontOfSize:12];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor blackColor];
    label.frame = CGRectMake(0, 0, 150, 25);
    label.center = CGPointMake(160, 240);
    label.alpha = 0.0;
    label.layer.cornerRadius = 5;
    label.clipsToBounds = YES;
    [self.view addSubview:label];
    
    // 3.动画
    [UIView animateWithDuration:0.5 animations:^{
        label.alpha = 0.5;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
            label.alpha = 0.0;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    }];
}

@end
