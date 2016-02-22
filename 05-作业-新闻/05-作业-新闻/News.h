//
//  News.h
//  05-作业-新闻
//
//  Created by 李南江 on 14-4-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject
@property (nonatomic, copy) NSString *title; // 标题
@property (nonatomic, copy) NSString *author; // 作者
@property (nonatomic, copy) NSString *icon; // 图片
@property (nonatomic, assign) int comments; // 评论数

- (id)initWithDict:(NSDictionary *)dict;
+ (id)newsWithDict:(NSDictionary *)dict;
@end