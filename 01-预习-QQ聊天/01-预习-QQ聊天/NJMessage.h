//
//  NJMessage.h
//  01-预习-QQ聊天
//
//  Created by 李南江 on 14-4-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    MJMessageTypeMe = 0, // 自己
    MJMessageTypeOther // 其他人
}   MJMessageType;

@interface NJMessage : NSObject
@property (copy, nonatomic) NSString *text;
@property (copy, nonatomic) NSString *time;
@property (assign, nonatomic) MJMessageType type;

// 是否隐藏时间
@property (assign, nonatomic) BOOL hiddenTime;

+ (instancetype)messageWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
