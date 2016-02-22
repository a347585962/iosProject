//
//  NJGroupHeader.m
//  03-预习-QQ好友列表
//
//  Created by 李南江 on 14-4-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJGroupHeader.h"
#import "NJGroup.h"

@interface NJGroupHeader()
@property (weak, nonatomic) UIButton *nameBtn;
@property (weak, nonatomic) UILabel *onlineLabel;
@end

@implementation NJGroupHeader

+ (instancetype)headerWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"group";
    NJGroupHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (header == nil) {
        header = [[NJGroupHeader alloc] initWithReuseIdentifier:ID];
        CGFloat headerW = tableView.frame.size.width;
        header.frame = CGRectMake(0, 0, headerW, 44);
    }
    return header;
}

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        // 1.组名按钮
        UIButton *nameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [nameBtn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [nameBtn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        [nameBtn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        nameBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        nameBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [nameBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        nameBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        nameBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [nameBtn addTarget:self action:@selector(nameClick) forControlEvents:UIControlEventTouchUpInside];
        nameBtn.imageView.contentMode = UIViewContentModeCenter;
        nameBtn.imageView.clipsToBounds = NO;
        [self addSubview:nameBtn];
        self.nameBtn = nameBtn;
        
        // 2.在线人数
        UILabel *onlineLabel = [[UILabel alloc] init];
        onlineLabel.textColor = [UIColor grayColor];
        onlineLabel.textAlignment = NSTextAlignmentRight;
        onlineLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:onlineLabel];
        self.onlineLabel = onlineLabel;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.组名
    self.nameBtn.frame = self.bounds;
    
    // 2.在线人数
    CGFloat onlineY = 0;
    CGFloat onlineH = self.frame.size.height;
    CGFloat onlineW = 150;
    CGFloat onlineX = self.frame.size.width - onlineW - 10;
    self.onlineLabel.frame = CGRectMake(onlineX, onlineY, onlineW, onlineH);
}

- (void)setGroup:(NJGroup *)group
{
    _group = group;
    
    // 1.组名
    [self.nameBtn setTitle:group.name forState:UIControlStateNormal];
    
    // 2.在线人数
    self.onlineLabel.text = [NSString stringWithFormat:@"%d/%d", group.online, group.friends.count];
}

- (void)nameClick {
    // 取反
    self.group.open = !self.group.open;
    
    // 通知代理
    if ([self.delegate respondsToSelector:@selector(groupHeaderClick:)]) {
        [self.delegate groupHeaderClick:self];
    }
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    // 设置箭头状态
    if (self.group.open) {
        self.nameBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        self.nameBtn.imageView.transform = CGAffineTransformIdentity;
    }
}
@end
