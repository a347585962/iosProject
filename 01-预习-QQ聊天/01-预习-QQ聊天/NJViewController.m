//
//  NJViewController.m
//  01-预习-QQ聊天
//
//  Created by 李南江 on 14-4-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJViewController.h"
#import "NJMessageCell.h"
#import "NJMessageFrame.h"
#import "NJMessage.h"

@interface NJViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
/** 输入框 */
@property (weak, nonatomic) IBOutlet UITextField *inputField;
/** 所有的frame信息 */
@property (strong, nonatomic) NSMutableArray *messageFrames;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation NJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 表格属性
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    
    // 监听键盘状态
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    // 文本框左边间距
    self.inputField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 0)];
    self.inputField.leftViewMode  = UITextFieldViewModeAlways;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSMutableArray *)messageFrames
{
    if (_messageFrames == nil) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil]];
        
        NSMutableArray *mfArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            // 消息模型
            NJMessage *msg = [NJMessage messageWithDict:dict];
            // 上一条消息模型
            NJMessageFrame *lastFrame = [mfArray lastObject];
            NJMessage *lastMsg = lastFrame.message;
            // 比较时间(跟上一条时间一样就隐藏时间)
            msg.hiddenTime = [lastMsg.time isEqualToString:msg.time];
            
            // 消息frame模型
            NJMessageFrame *mf = [[NJMessageFrame alloc] init];
            mf.message = msg;
            [mfArray addObject:mf];
        }
        
        _messageFrames = mfArray;
    }
    return _messageFrames;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

// 添加信息
- (void)addMsgWithText:(NSString *)text type:(MJMessageType)type
{
    // 1.格式化工具
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"HH:mm";
    
    // 2.创建新消息
    NJMessage *msg = [[NJMessage alloc] init];
    msg.type = type;
    msg.text = text;
    msg.time = [fmt stringFromDate:[NSDate date]];
    
    // 3.是否显示时间
    // 上一条消息模型
    NJMessageFrame *lastFrame = [self.messageFrames lastObject];
    NJMessage *lastMsg = lastFrame.message;
    // 比较时间(跟上一条时间一样就隐藏时间)
    msg.hiddenTime = [lastMsg.time isEqualToString:msg.time];
    
    // 4.添加消息frame模型
    NJMessageFrame *mf = [[NJMessageFrame alloc] init];
    mf.message = msg;
    [self.messageFrames addObject:mf];
    
    // 5.刷新表格
    NSIndexPath *path = [NSIndexPath indexPathForRow:self.messageFrames.count - 1 inSection:0];
    [self.tableView reloadData]; // 刷新表格
    // 滚动到最底部
    [self.tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // 1.发消息
    [self addMsgWithText:textField.text type:MJMessageTypeMe];
    
    // 2.回消息
    [self addMsgWithText:[NSString stringWithFormat:@"%@你个蛋啊", textField.text] type:MJMessageTypeOther];
    
    // 3.清除文本
    textField.text = nil;
    return NO;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NJMessageCell *cell = [NJMessageCell cellWithTableView:tableView];
    cell.messageFrame = self.messageFrames[indexPath.row];
    return cell;
}

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.messageFrames[indexPath.row] cellHeight];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

- (void)keyboardWillChangeFrame:(NSNotification *)note
{
    // 1.设置窗口颜色
    self.view.window.backgroundColor = self.tableView.backgroundColor;
    
    // 2.取得键盘参数
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGFloat keyboardY = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y;
    
    // 3.动画
    [UIView animateWithDuration:duration animations:^{
        CGFloat ty = keyboardY - self.view.frame.size.height;
        self.view.transform = CGAffineTransformMakeTranslation(0, ty);
    }];
}

@end
