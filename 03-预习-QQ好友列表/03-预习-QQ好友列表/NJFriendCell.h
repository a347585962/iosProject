//
//  NJFriendCell.h
//  03-预习-QQ好友列表
//
//  Created by 李南江 on 14-4-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//


#import <UIKit/UIKit.h>
@class NJFriend;

@interface NJFriendCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (strong, nonatomic) NJFriend *friendData;
@end