//
//  NJGroup.h
//  03-预习-QQ好友列表
//
//  Created by 李南江 on 14-4-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NJGroup : NSObject
@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) int online;
@property (strong, nonatomic) NSArray *friends;

// 是否打开
@property (assign, nonatomic) BOOL open;

+ (instancetype)groupWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
