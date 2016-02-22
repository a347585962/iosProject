//
//  NJAppCell.h
//  04-app管理
//
//  Created by 李南江 on 14-4-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NJApp, NJAppCell;

@protocol MJAppCellDelegate <NSObject>
@optional
- (void)appCellDidClickedDownloadBtn:(NJAppCell *)cell;
@end

@interface NJAppCell : UITableViewCell
@property (strong, nonatomic) NJApp *app;

@property (weak, nonatomic) id<MJAppCellDelegate> delegate;
@end
