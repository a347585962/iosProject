//
//  NewsCell.h
//  05-作业-新闻
//
//  Created by 李南江 on 14-4-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class News;
@interface NewsCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *authorLabel;
@property (nonatomic, weak) IBOutlet UILabel *commentsLabel;
@property (nonatomic, weak) IBOutlet UIImageView *iconView;

@property (nonatomic, strong) News *news; // 模型数据

+ (id)newsCell;
+ (NSString *)ID;
@end
