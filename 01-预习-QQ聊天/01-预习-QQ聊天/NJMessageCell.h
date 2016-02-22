//
//  NJMessageCell.h
//  01-预习-QQ聊天
//
//  Created by 李南江 on 14-4-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NJMessageFrame;

@interface NJMessageCell : UITableViewCell
@property (strong, nonatomic) NJMessageFrame *messageFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end