//
//  MineViewController.m
//  美团
//
//  Created by 金亮齐 on 2017/6/30.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "MineViewController.h"
#import "SettingHeaderView.h"
#import "LoginView.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray *_dataSourceArray;
}
@property (nonatomic , weak) UITableView *tableview;
@property(weak,nonatomic) UIView *headerview;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initData];
    [self initViews];
    // Do any additional setup after loading the view.
}

-(void)initData{
    _dataSourceArray = [[NSMutableArray alloc] init];
    NSMutableDictionary *dic1 = [[NSMutableDictionary alloc] init];
    [dic1 setObject:@"团购订单" forKey:@"title"];
    [dic1 setObject:@"icon_mine_onsite" forKey:@"image"];
    [_dataSourceArray addObject:dic1];
    NSMutableDictionary *dic2 = [[NSMutableDictionary alloc] init];
    [dic2 setObject:@"预定订单" forKey:@"title"];
    [dic2 setObject:@"icon_mine_onsite" forKey:@"image"];
    [_dataSourceArray addObject:dic2];
    NSMutableDictionary *dic3 = [[NSMutableDictionary alloc] init];
    [dic3 setObject:@"上门订单" forKey:@"title"];
    [dic3 setObject:@"icon_mine_onsite" forKey:@"image"];
    [_dataSourceArray addObject:dic3];
    NSMutableDictionary *dic4 = [[NSMutableDictionary alloc] init];
    [dic4 setObject:@"我的评价" forKey:@"title"];
    [dic4 setObject:@"icon_mine_onsite" forKey:@"image"];
    [_dataSourceArray addObject:dic4];
    NSMutableDictionary *dic5 = [[NSMutableDictionary alloc] init];
    [dic5 setObject:@"每日推荐" forKey:@"title"];
    [dic5 setObject:@"icon_mine_onsite" forKey:@"image"];
    [_dataSourceArray addObject:dic5];
    NSMutableDictionary *dic6 = [[NSMutableDictionary alloc] init];
    [dic6 setObject:@"会员俱乐部" forKey:@"title"];
    [dic6 setObject:@"icon_mine_onsite" forKey:@"image"];
    [_dataSourceArray addObject:dic6];
    NSMutableDictionary *dic7 = [[NSMutableDictionary alloc] init];
    [dic7 setObject:@"我的抽奖" forKey:@"title"];
    [dic7 setObject:@"icon_mine_onsite" forKey:@"image"];
    [_dataSourceArray addObject:dic7];
    NSMutableDictionary *dic8 = [[NSMutableDictionary alloc] init];
    [dic8 setObject:@"我的抵用券" forKey:@"title"];
    [dic8 setObject:@"icon_mine_onsite" forKey:@"image"];
    [_dataSourceArray addObject:dic8];
}

-(void)initViews{
    
    SettingHeaderView *headerview = [[SettingHeaderView alloc] init];
    headerview.loginBlock = ^{
        LoginView *lv = [[LoginView alloc]init];
        [lv show];
    };
    self.headerview = headerview;
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_width, screen_height) style:UITableViewStyleGrouped];
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    tableview.tableHeaderView = headerview;
    self.tableview = tableview;

}
#pragma mark - UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section ==0) {
        return 0;
    }else{
        return 8;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 5;
    }else{
        return 5;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 60;
    }else{
        return 40;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_width, 75)];
    footerView.backgroundColor = RGB(239, 239, 244);
    return footerView;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentifier = @"mineCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    };
    
    if (indexPath.section == 1) {
        cell.textLabel.text = [_dataSourceArray[indexPath.row] objectForKey:@"title"];
        NSString *imgStr = [_dataSourceArray[indexPath.row] objectForKey:@"image"];
        cell.imageView.image = [UIImage imageNamed:imgStr];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.font = [UIFont systemFontOfSize:15];
    }
    return cell;
}
@end
