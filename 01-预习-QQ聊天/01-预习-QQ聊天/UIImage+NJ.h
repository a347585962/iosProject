//
//  UIImage+NJ.h
//  01-预习-QQ聊天
//
//  Created by 李南江 on 14-4-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (NJ)
+ (UIImage *)resizedImageNamed:(NSString *)name leftScale:(CGFloat)leftScale topScale:(CGFloat)topScale;

+ (UIImage *)resizedImageNamed:(NSString *)name;
@end
