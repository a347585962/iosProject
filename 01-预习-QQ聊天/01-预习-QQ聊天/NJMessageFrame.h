//
//  NJMessageFrame.h
//  01-预习-QQ聊天
//
//  Created by 李南江 on 14-4-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#define MJTimeFont [UIFont systemFontOfSize:13]
#define MJTextFont [UIFont systemFontOfSize:15]

#import <Foundation/Foundation.h>
@class NJMessage;
@interface NJMessageFrame : NSObject
@property (strong, nonatomic) NJMessage *message;

@property (assign, nonatomic, readonly) CGRect timeF;
@property (assign, nonatomic, readonly) CGRect iconF;
@property (assign, nonatomic, readonly) CGRect textF;
@property (assign, nonatomic, readonly) CGFloat cellHeight;
@end
