//
//  NJGroup.m
//  03-预习-QQ好友列表
//
//  Created by 李南江 on 14-4-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJGroup.h"
#import "NJFriend.h"

@implementation NJGroup
+ (instancetype)groupWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        // 1.设置基本属性
        [self setValuesForKeysWithDictionary:dict];
        
        // 2.friends字典转模型
        NSMutableArray *friendArray = [NSMutableArray array];
        for (NSDictionary *dict in self.friends) {
            NJFriend *f = [NJFriend friendWithDict:dict];
            [friendArray addObject:f];
        }
        self.friends = friendArray;
    }
    return self;
}
@end
