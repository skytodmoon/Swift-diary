//
//  QJLMeViewController.m
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/6.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLMeViewController.h"
#import "UIBarButtonItem+QJLExtension.h"
#import "QJLLoginRegisterController.h"
#import "QJLSettingViewController.h"
#import "QJLMineFooterView.h"
#import "QJLMineCell.h"
#import "QJLConst.h"

@interface QJLMeViewController ()

@end

@implementation QJLMeViewController

static NSString *mineID = @"mine";



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    
    [self setupTableView];
    // Do any additional setup after loading the view.
}


-(void)setupNav{
    self.view.backgroundColor = QJLlobalBg;
    //设置导航栏内容
    self.navigationItem.title = @"我的";
    //设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"nav_coin_icon" highImage:@"nav_coin_icon_click" target:self action:@selector(coinButtonClick)];
    //设置导航栏右边的按钮
    self.navigationItem.rightBarButtonItems = @[[UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingButtonClick)],[UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click"target:self action:@selector(moonButtonClick)]];
    
}

-(void)setupTableView{
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[QJLMineCell class] forCellReuseIdentifier:mineID];
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = QJLTopicCellMargin;
    self.tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
    self.tableView.tableFooterView = [[QJLMineFooterView alloc] initWithFrame: CGRectMake(0, 0,SCREENW , 500)];

}
-(void)coinButtonClick{
                                                
}
-(void)moonButtonClick{
                                                
}
-(void)settingButtonClick {
    
    QJLSettingViewController *setting = [[QJLSettingViewController alloc] init];
    setting.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:setting animated:YES];
    
}


#pragma mark -UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{

 return 1;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mineID];
    
    if (indexPath.section == 0) {
        cell.imageView.image = [UIImage imageNamed:@"setup-head-default"];
        cell.textLabel.text  = @"登录/注册";
    } else if (indexPath.section == 1){
        cell.textLabel.text = @"离线下载";
    }
    
    return cell;
}

#pragma mark -UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    if (indexPath.section==0) {
            QJLLoginRegisterController *login = [[QJLLoginRegisterController alloc] init];
            [self presentViewController:login animated:YES completion:nil];
    }else if (indexPath.section==1){
            NSLog(@"点击了离线下载");
        }
    
}
@end
