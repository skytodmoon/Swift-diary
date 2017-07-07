//
//  HomeViewController.m
//  美团
//
//  Created by 金亮齐 on 2017/6/29.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "HomeViewController.h"
#import "MapViewController.h"
#import "HotQueueModel.h"

@interface HomeViewController (){
    NSMutableArray *_menuArray;//
    NSMutableArray *_rushArray;//抢购数据
    HotQueueModel *_hotQueueData;
    NSMutableArray *_recommendArray;
    NSMutableArray *_discountArray;
    
    
    
}
@property(nonatomic, strong) UITableView *tableView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    [self initData];
    [self setNav];
    [self initTableView];
    // Do any additional setup after loading the view.
}

//MARK - 初始化数据
-(void)initData{
    _rushArray = [[NSMutableArray alloc] init];
    _hotQueueData = [[HotQueueModel alloc] init];
    _recommendArray = [[NSMutableArray alloc] init];
    _discountArray = [[NSMutableArray alloc] init];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"menuData" ofType:@"plist"];
    _menuArray = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
}

-(void)setNav{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_width, 64)];
    backView.backgroundColor = navigationBarColor;
    [self.view addSubview:backView];
    
    //城市
    UIButton *cityBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cityBtn.frame = CGRectMake(10, 30, 40, 25);
    cityBtn.font = [UIFont systemFontOfSize:15];
    [cityBtn setTitle:@"深圳" forState:UIControlStateNormal];
    [backView addSubview:cityBtn];
    
    UIImageView *arrowImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(cityBtn.frame), 38, 13, 10)];
    [arrowImage setImage:[UIImage imageNamed:@"icon_homepage_downArrow"]];
    [backView addSubview:arrowImage];
    
    //地图
    UIButton *mapBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    mapBtn.frame = CGRectMake(screen_width-42, 30, 42, 30);
    [mapBtn setImage:[UIImage imageNamed:@"icon_homepage_map_old"] forState:UIControlStateNormal];
    [mapBtn addTarget:self action:@selector(OnMapBtnTap:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:mapBtn];
    
    UIView *searchView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(arrowImage.frame)+10, 30, 200, 25)];
    searchView.backgroundColor = RGB(7, 170, 153);
    searchView.layer.masksToBounds = YES;
    searchView.layer.cornerRadius = 12;
    [backView addSubview:searchView];
    
    UIImageView *searchImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 3, 15, 15)];
    [searchImage setImage:[UIImage imageNamed:@"icon_homepage_search"]];
    [searchView addSubview:searchImage];
    
    UILabel *placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 0, 150, 25)];
    placeHolderLabel.font = [UIFont boldSystemFontOfSize:13];
    placeHolderLabel.text = @"请输入商家、品类、商圈";
    placeHolderLabel.textColor = [UIColor whiteColor];
    [searchView addSubview:placeHolderLabel];
}

-(void)initTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, screen_width, screen_height-49-64) style:UITableViewStyleGrouped];
    
    [self.view addSubview:self.tableView];
}

-(void)OnMapBtnTap:(UIButton *)sender{
    MapViewController *MapVC = [[MapViewController alloc]init];
    [self.navigationController pushViewController:MapVC animated:YES];
}
@end
