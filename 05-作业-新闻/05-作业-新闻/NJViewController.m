//
//  NJViewController.m
//  05-作业-新闻
//
//  Created by 李南江 on 14-4-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJViewController.h"
#import "News.h"
#import "NewsCell.h"

@interface NJViewController ()
{
    NSMutableArray *_newses;
}
@end

@implementation NJViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.如果每一行cell的高度一样
    self.tableView.rowHeight = 80;
    
    // 2.加载plist数据
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"news.plist" ofType:nil]];
    
    // 3.字典转模型
    _newses = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [_newses addObject:[News newsWithDict:dict]];
    }
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _newses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.从缓存池中取出cell
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:[NewsCell ID]];
    
    // 2.缓存池中没有cell
    if (cell == nil) {
        // 创建一个Cell对象
        cell = [NewsCell newsCell];
    }
    
    // 3.传递模型数据
    cell.news = _newses[indexPath.row];
    
    return cell;
}

//        NSArray *objects = [[NSBundle mainBundle] loadNibNamed:@"NewsCell" owner:nil options:nil];
//
//        UINib *nib = [UINib nibWithNibName:@"NewsCell" bundle:nil];
//        NSArray *objects = [nib instantiateWithOwner:nil options:nil];
//        cell = objects[0];

//    [cell setNews:news];

// 4.新闻标题
//    UILabel *titleLabel = (UILabel *)[cell viewWithTag:1];
//    titleLabel.text = news.title;
//
//    // 5.新闻图片
//    UIImageView *imageView = (UIImageView *)[cell viewWithTag:4];
//    imageView.image = [UIImage imageNamed:news.icon];
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

#pragma mark 通过代理方法返回cell的高度
// 如果每一行cell的高度不一定一样，用代理方法返回高度
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 80;
//}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}
@end
