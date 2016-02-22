//
//  NJMessageCell.m
//  01-预习-QQ聊天
//
//  Created by 李南江 on 14-4-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJMessageCell.h"
#import "NJMessage.h"
#import "NJMessageFrame.h"
#import "UIImage+NJ.h"

@interface NJMessageCell()
@property (weak, nonatomic) UILabel *timeLabel;
@property (weak, nonatomic) UIImageView *iconView;
@property (weak, nonatomic) UIButton *textBtn;
@end

@implementation NJMessageCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    NJMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[NJMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 添加子控件
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.font = MJTimeFont;
        timeLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:timeLabel];
        self.timeLabel = timeLabel;
        
        UIImageView *iconView = [[UIImageView alloc] init];
        iconView.layer.cornerRadius = 8;
        iconView.clipsToBounds = YES;
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        UIButton *textBtn = [[UIButton alloc] init];
        textBtn.titleLabel.font = MJTextFont;
        textBtn.titleLabel.numberOfLines = 0;
        [self.contentView addSubview:textBtn];
        self.textBtn = textBtn;
        
        // cell的设置
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setMessageFrame:(NJMessageFrame *)messageFrame
{
    _messageFrame = messageFrame;
    
    NJMessage *msg = messageFrame.message;
    
    // 1.时间
    if (msg.hiddenTime) {
        self.timeLabel.hidden = YES;
    } else {
        self.timeLabel.hidden = NO;
        self.timeLabel.text = msg.time;
        self.timeLabel.frame = messageFrame.timeF;
    }
    
    // 2.头像
    self.iconView.image = [UIImage imageNamed:(msg.type == MJMessageTypeMe) ? @"me" : @"other"];
    self.iconView.frame = messageFrame.iconF;
    
    // 3.聊天内容
    [self.textBtn setTitle:msg.text forState:UIControlStateNormal];
    self.textBtn.frame = messageFrame.textF;
    
    // 4.设置聊天背景
    NSString *normal, *high;
    if (msg.type == MJMessageTypeOther) {
        normal = @"chat_recive_nor";
        high = @"chat_recive_press_pic";
        [self.textBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    } else {
        normal = @"chat_send_nor";
        high = @"chat_send_press_pic";
        [self.textBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    self.textBtn.contentEdgeInsets = UIEdgeInsetsMake(15, 20, 15, 20);
    [self.textBtn setBackgroundImage:[UIImage resizedImageNamed:normal] forState:UIControlStateNormal];
    [self.textBtn setBackgroundImage:[UIImage resizedImageNamed:high] forState:UIControlStateHighlighted];
}


@end
