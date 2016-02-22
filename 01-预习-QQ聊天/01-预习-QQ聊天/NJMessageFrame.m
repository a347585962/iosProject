//
//  NJMessageFrame.m
//  01-预习-QQ聊天
//
//  Created by 李南江 on 14-4-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJMessageFrame.h"
#import "NJMessage.h"

// 控件之间的间距
#define MJMargin 10
#define MJIconW 40
#define MJIconH 40

@implementation NJMessageFrame

- (void)setMessage:(NJMessage *)message
{
    _message = message;
    
    // 1.如果需要显示时间
    if (message.hiddenTime == NO) {
        CGFloat timeW = [UIScreen mainScreen].bounds.size.width;
        CGFloat timeH = 35;
        _timeF = CGRectMake(0, 0, timeW, timeH);
    }
    
    // 2.头像的位置
    CGFloat iconX;
    CGFloat iconY = CGRectGetMaxY(_timeF) + MJMargin;
    
    // 3.文字的位置
    CGFloat textY = iconY;
    CGFloat textX;
    
    // 4.文字的尺寸
    CGFloat textMaxW = 150; // 内部文本的最大宽度
    NSDictionary *attrs = @{ NSFontAttributeName : MJTextFont };
    CGSize textSize = [message.text boundingRectWithSize:CGSizeMake(textMaxW, MAXFLOAT) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    CGFloat textW = textSize.width + 40;
    CGFloat textH = textSize.height + 30;
    
    // 5.根据信息类型计算头像和文本的x
    if (message.type == MJMessageTypeOther) {
        iconX = MJMargin;
        textX = iconX + MJIconW + MJMargin;
    } else {
        iconX = [UIScreen mainScreen].bounds.size.width - MJMargin - MJIconW;
        textX = iconX - MJMargin - textW;
    }
    
    // 6.设置头像和文字的frame
    _iconF = CGRectMake(iconX, iconY, MJIconW, MJIconH);
    _textF = CGRectMake(textX, textY, textW, textH);
    
    // 7.cell的高度
    CGFloat maxH = MAX(CGRectGetMaxY(_iconF), CGRectGetMaxY(_textF));
    _cellHeight = maxH + MJMargin;
}

@end
