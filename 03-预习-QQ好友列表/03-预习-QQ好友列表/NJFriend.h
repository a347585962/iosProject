//
//  NJFriend.h
//  03-预习-QQ好友列表
//
//  Created by 李南江 on 14-4-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NJFriend : NSObject
@property (copy, nonatomic) NSString *icon;
@property (copy, nonatomic) NSString *intro;
@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) BOOL vip;

+ (instancetype)friendWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
