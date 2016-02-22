//
//  News.m
//  05-作业-新闻
//
//  Created by 李南江 on 14-4-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "News.h"

@implementation News

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        //        NSLog(@"---------");
        //        [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        //            NSLog(@"%@ -- %@", key, obj);
        //
        //            SEL selector = NSSelectorFromString(<#NSString *aSelectorName#>)
        //            [self performSelector:selector withObject:obj];
        //        }];
        //        NSLog(@"---------");
        // 解析字典属性
        self.title = dict[@"title"];
        self.icon = dict[@"icon"];
        self.author = dict[@"author"];
        self.comments = [dict[@"comments"] intValue];
    }
    return self;
}

+ (id)newsWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
