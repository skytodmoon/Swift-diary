//
//  ProfileViewController.m
//  全民TV
//
//  Created by 金亮齐 on 2017/7/24.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "ProfileViewController.h"
#import "SettingHeaderView.h"
#import "LoginView.h"

@interface ProfileViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray *_dataSourceArray;
}
@property (nonatomic , weak) UITableView *tableview;
@property(weak,nonatomic) UIView *headerview;


@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViews];
    // Do any additional setup after loading the view.
}

-(void)initViews{
    
    SettingHeaderView *headerview = [[SettingHeaderView alloc] init];
    headerview.loginBlock = ^{
        LoginView *lv = [[LoginView alloc]init];
        [lv show];
    };
    self.headerview = headerview;
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
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
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 75)];
    footerView.backgroundColor = RGBColor(239, 239, 244,1.0);
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
