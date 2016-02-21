//
//  hero.m
//  uitableview
//
//  Created by wusonglin on 16/2/5.
//  Copyright © 2016年 wusonglin. All rights reserved.
//

#import "hero.h"

@implementation hero

- (instancetype)initWithDict:(NSDictionary*)dict
{
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
        
    }
    return self;
}
+ (instancetype)heroWithDict:(NSDictionary*)dict
{


    return [[self alloc] initWithDict:dict];

}


@end
