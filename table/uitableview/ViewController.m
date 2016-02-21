//
//  ViewController.m
//  uitableview
//
//  Created by wusonglin on 16/2/5.
//  Copyright © 2016年 wusonglin. All rights reserved.
//

#import "ViewController.h"
#import "Group.h"
#import "hero.h"
#import "SLTg.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

//保存所有数据（每一个元素都是一个模型对象）
@property (nonatomic,strong) NSArray* groups;

//保存所有的银熊数据
@property (nonatomic,strong) NSArray* tgs;

@end




@implementation ViewController

- (NSArray *)tgs
{

    if (_tgs == nil) {
        
        //创建模型
        //获取全路径
        
        NSString* fullPath = [[NSBundle mainBundle]pathForResource:@"tgs" ofType:@"plist"];
        
        //根据全路径加载数据
        
        NSArray* dictArry = [NSArray arrayWithContentsOfFile:fullPath];
        
        //字典转模型
        //
        NSMutableArray *model = [NSMutableArray arrayWithCapacity:dictArry.count];
        for(NSDictionary* dict in dictArry){
        
            SLTg *h = [SLTg tgWithDict:dict];
            [model addObject:h];
            
        }
        //利用copy,存放数组
        _tgs = [model copy];
    }
    
    return _tgs;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //设置数据源
    self.tableView.dataSource = self;
//    self.tableView.delegate = self;
//    self.tableView.rowHeight = 50;
    
}
#pragma mark - UITableViewDataSource

//告诉table一共有多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

//第section组有多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //取出对应组模型

//    Group* g = self.groups[section];
    
    return self.tgs.count;
//    return 3;
}



//告知系统每一行显示什么内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建对象，默认样式
//    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    static NSString* identifier = @"tg";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//
    if(cell == nil){
    
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SLTg" owner:nil options:nil]firstObject];
        
    }
//    SLTg *h = self.tgs[indexPath.row];
    cell.textLabel.text = @"111";
////    cell.detailTextLabel.text = h.intro;
//    cell.imageView.image = [UIImage imageNamed:h.icon];
//    cell.textLabel.text = h.title;
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"￥%@  %@  ",h.price,h.buyCount];
    
//    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
//    cell.accessoryView = [[UISwitch alloc ] init];
    
    /*
     
     
     
     */
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{

    Group *g = self.groups[section];
    return g.title;
//    return @"标题";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    Group *g = self.groups[section];
    return g.desc;
}

//代理方法
//当每一行的cell高度不一致的时候，使用代理方法
//-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//
//    NSLog(@"---");
//    return 120;
//}

#pragma mark - 控制状态栏是否显示

- (BOOL)prefersStatusBarHidden
{

    return YES;
}




@end
