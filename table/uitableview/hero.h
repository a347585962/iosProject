//
//  hero.h
//  uitableview
//
//  Created by wusonglin on 16/2/5.
//  Copyright © 2016年 wusonglin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface hero : NSObject

/**

 头像
 
 **/
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *intro;


- (instancetype)initWithDict:(NSDictionary*)dict;
+ (instancetype)heroWithDict:(NSDictionary*)dict;

@end
