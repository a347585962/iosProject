//
//  Group.h
//  uitableview
//
//  Created by wusonglin on 16/2/5.
//  Copyright © 2016年 wusonglin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Group : NSObject

//标题
@property (nonatomic,copy) NSString *title;

//描述
@property (nonatomic,copy) NSString *desc;

//当前组所有行的数据
@property (nonatomic,strong) NSArray* array;




@end
