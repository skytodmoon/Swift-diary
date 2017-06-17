//
//  HomeViewController.m
//  全民TV
//
//  Created by 金亮齐 on 2017/6/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "HomeViewController.h"
#import "TYTabButtonPagerController.h"

@interface HomeViewController ()
//<TYPagerControllerDataSource>
@property (nonatomic, strong) TYTabButtonPagerController *pagerController;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏
    [self setupNav];
    
//    [self addPagerController];
//    [self configureTabButtonPager];
    

    // Do any additional setup after loading the view.
}
- (void)setupNav {

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"img_nav_logo_77x20_" highIcon:nil target:self action:@selector(updateHomeData)];
    
    UIBarButtonItem *itemScan = [UIBarButtonItem itemWithIcon:@"Image_scan_22x22_" highIcon:@"Image_scan_click_22x22_" target:self action:@selector(scan)];
    
    UIBarButtonItem *itemMargin1 = [[UIBarButtonItem alloc] initWithCustomView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 1)]];
    
    UIBarButtonItem *itemSearch = [UIBarButtonItem itemWithIcon:@"btn_search_22x22_" highIcon:@"btn_search_clicked_22x22_" target:self action:@selector(search)];
    
    UIBarButtonItem *itemMargin2 = [[UIBarButtonItem alloc] initWithCustomView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 1)]];
    
    UIBarButtonItem *itemHistory = [UIBarButtonItem itemWithIcon:@"image_my_history_26x26_" highIcon:@"Image_my_history_click_22x22_" target:self action:@selector(history)];
    
    self.navigationItem.rightBarButtonItems = @[ itemScan, itemMargin1, itemSearch, itemMargin2, itemHistory ];
}

//MARK: - 添加视图
- (void)addPagerController
{
    TYTabButtonPagerController *pagerController = [[TYTabButtonPagerController alloc]init];
    pagerController.adjustStatusBarHeight = YES;
//    pagerController.dataSource  = self;
    pagerController.barStyle    = TYPagerBarStyleCoverView;
    pagerController.cellSpacing = 8;
    
    pagerController.view.frame = self.view.bounds;
    [self addChildViewController:pagerController];
    [self.view addSubview:pagerController.view];
    _pagerController = pagerController;
}

- (void)configureTabButtonPager
{
    self.pagerController.normalTextColor   = HexRGB(0x5a5a5c);
    self.pagerController.selectedTextColor = HexRGB(0xf15b5a);
    self.pagerController.progressColor     = HexRGB(0xf1f1f1);
    self.pagerController.normalTextFont    =
    self.pagerController.selectedTextFont  = [UIFont systemFontOfSize:16.f];
}



- (void)updateHomeData {
    NSLog(@"首页更新");
}

- (void)scan {
    NSLog(@"扫描");
}

- (void)search {
    NSLog(@"搜索");
}

- (void)history {
    NSLog(@"历史");
}

@end
