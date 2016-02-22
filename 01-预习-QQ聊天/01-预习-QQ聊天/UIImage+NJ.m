//
//  UIImage+NJ.m
//  01-预习-QQ聊天
//
//  Created by 李南江 on 14-4-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//


#import "UIImage+NJ.h"

@implementation UIImage (NJ)
+ (UIImage *)resizedImageNamed:(NSString *)name
{
    return [self resizedImageNamed:name leftScale:0.5 topScale:0.5];
}

+ (UIImage *)resizedImageNamed:(NSString *)name leftScale:(CGFloat)leftScale topScale:(CGFloat)topScale
{
    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * leftScale topCapHeight:image.size.height * topScale];
}
@end
