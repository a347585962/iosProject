//
//  NJFriendCell.m
//  03-预习-QQ好友列表
//
//  Created by 李南江 on 14-4-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJFriendCell.h"
#import "NJFriend.h"

@implementation NJFriendCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"friend";
    NJFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[NJFriendCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.font = [UIFont boldSystemFontOfSize:14];
    }
    return self;
}

- (void)setFriendData:(NJFriend *)friendData
{
    _friendData = friendData;
    
    // 1.图片
    self.imageView.image = [UIImage imageNamed:friendData.icon];
    
    // 2.昵称
    self.textLabel.text = friendData.name;
    self.textLabel.textColor = friendData.vip ? [UIColor redColor] : [UIColor blackColor];
    
    // 3.简介
    self.detailTextLabel.text = friendData.intro;
}

@end
