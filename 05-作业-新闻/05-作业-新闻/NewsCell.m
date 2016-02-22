//
//  NewsCell.m
//  05-作业-新闻
//
//  Created by 李南江 on 14-4-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NewsCell.h"
#import "News.h"

@implementation NewsCell
+ (id)newsCell
{
    return [[NSBundle mainBundle] loadNibNamed:@"NewsCell" owner:nil options:nil][0];
}

- (void)setNews:(News *)news
{
    // 0.保存成员变量
    _news = news;
    
    // 1.标题
    _titleLabel.text = news.title;
    
    // 2.作者
    _authorLabel.text = news.author;
    
    // 3.评论数
    _commentsLabel.text = [NSString stringWithFormat:@"评论：%d", news.comments];
    
    // 4.图片
    _iconView.image = [UIImage imageNamed:news.icon];
}

+ (NSString *)ID
{
    return @"mynews";
}

@end
