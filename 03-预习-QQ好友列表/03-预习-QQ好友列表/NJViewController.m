//
//  NJViewController.m
//  03-预习-QQ好友列表
//
//  Created by 李南江 on 14-4-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJViewController.h"
#import "NJGroup.h"
#import "NJFriendCell.h"
#import "NJGroupHeader.h"

@interface NJViewController () <NJGroupHeaderDelegate>
@property (strong, nonatomic) NSArray *groups;
@end

@implementation NJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.rowHeight = 50;
    self.tableView.sectionHeaderHeight = 44;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (NSArray *)groups
{
    if (_groups == nil) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil]];
        
        NSMutableArray *groupArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            NJGroup *group = [NJGroup groupWithDict:dict];
            [groupArray addObject:group];
        }
        
        _groups = groupArray;
    }
    return _groups;
}

#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NJGroup *group = self.groups[section];
    return group.open ? group.friends.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    NJFriendCell *cell = [NJFriendCell cellWithTableView:tableView];
    
    // 2.给cell传递模型数据
    NJGroup *group = self.groups[indexPath.section];
    cell.friendData = group.friends[indexPath.row];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // 1.创建header
    NJGroupHeader *header = [NJGroupHeader headerWithTableView:tableView];
    
    // 设置代理
    header.delegate = self;
    
    // 2.传递模型
    header.group = self.groups[section];
    
    return header;
}

- (void)groupHeaderClick:(NJGroupHeader *)header
{
    [self.tableView reloadData];
}

@end
