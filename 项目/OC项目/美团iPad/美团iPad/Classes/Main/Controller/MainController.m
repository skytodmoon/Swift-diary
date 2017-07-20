//
//  MainController.m
//  美团iPad
//
//  Created by 金亮齐 on 2017/7/19.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "MainController.h"
#import "NavMenu.h"
#import "MapViewController.h"
#import "SearchViewController.h"
#import "SortViewController.h"
#import "RegionsViewController.h"
#import "CatagoryViewController.h"
#import "CityModal.h"
#import "RegionModal.h"
#import "SortModal.h"
#import "CategoryModal.h"
#import "FindDealsParam.h"

@interface MainController()

@property (nonatomic, weak) NavMenu *categoryMenu;
@property (nonatomic, weak) NavMenu *regionMenu;
@property (nonatomic, weak) NavMenu *sortMenu;

@property (nonatomic, strong) SortViewController *sortViewController;
@property (nonatomic, strong) RegionsViewController *regionsViewContriller;
@property (nonatomic, strong) CatagoryViewController *catagoryViewController;


/** 选中的状态 */
@property (nonatomic, strong) CityModal *city;
/** 当前选中的区域 */
@property (strong, nonatomic) RegionModal *region;
/** 当前选中的子区域名称 */
@property (copy, nonatomic) NSString *subRegionName;
/** 当前选中的排序 */
@property (strong, nonatomic) SortModal *sort;
/** 当前选中的分类 */
@property (strong, nonatomic) CategoryModal *category;
/** 当前选中的子分类名称 */
@property (copy, nonatomic) NSString *subCategoryName;

/** 请求参数 */
@property (nonatomic, strong) FindDealsParam *lastParam;
/**
 *  存储请求结果的总数
 */
@property (nonatomic, assign) NSInteger totalNumber;


//加载错误后记录
@property (nonatomic, strong) RegionModal *regionSuccess;
@property (nonatomic, copy) NSString *subRegionNameSuccess;
@property (nonatomic, strong) CategoryModal *categorySuccess;
@property (nonatomic, copy) NSString *subCategoryNameSuccess;

@end

@implementation MainController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    //** 设置导航栏左边的内容 **//
    [self setupLeftBtn];
    //** 设置导航栏右边的内容 **//
    [self setupRightBtn];
}

-(void)setupLeftBtn{
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_meituan_logo"]];
    NavMenu *categoryMenu = [NavMenu navMenu];
    NavMenu *regionMenu = [NavMenu navMenu];
    NavMenu *sortMemu = [NavMenu navMenu];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:image];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithCustomView:categoryMenu];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithCustomView:regionMenu];
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc]initWithCustomView:sortMemu];
    self.categoryMenu = categoryMenu;
    self.regionMenu = regionMenu;
    self.sortMenu = sortMemu;
    [categoryMenu addTarget:self action:@selector(categoryClick)];
    [regionMenu addTarget:self action:@selector(regionMenu)];
    [sortMemu addTarget:self action:@selector(sortMenu)];
    
    [sortMemu.clickBtn setImage:[UIImage imageNamed:@"icon_sort"] forState:UIControlStateNormal];
    [sortMemu.clickBtn setImage:[UIImage imageNamed:@"icon_sort_highlighted"] forState:UIControlStateHighlighted];
    sortMemu.title.text = @"排序";
    sortMemu.subTitle.text = self.sort.label;
    [regionMenu.clickBtn setImage:[UIImage imageNamed:@"icon_district"] forState:UIControlStateNormal];
    [regionMenu.clickBtn setImage:[UIImage imageNamed:@"icon_district_highlighted"] forState:UIControlStateHighlighted];
    regionMenu.title.text = [NSString stringWithFormat:@"%@ - 全部",self.city.name];
    regionMenu.subTitle.text = self.subRegionName;
    categoryMenu.title.text = @"全部分类";
    self.navigationItem.leftBarButtonItems = @[item,item1,item2,item3];
}

-(void)setupRightBtn{
  
    UIBarButtonItem *mapItem = [UIBarButtonItem itemWithImageName:@"icon_map" highImageName:@"icon_map_highlighted" target:self action:@selector(mapClick)];
    
    UIBarButtonItem *searchItem = [UIBarButtonItem itemWithImageName:@"icon_search" highImageName:@"icon_search_highlighted" target:self action:@selector(searchClick)];
    
    mapItem.customView.width = searchItem.customView.width = 60;
    self.navigationItem.rightBarButtonItems = @[mapItem,searchItem];
}

-(void)mapClick{
    MapViewController *map = [[MapViewController alloc]init];
    NavController *nav = [[NavController alloc]initWithRootViewController:map];
    
    [self presentViewController:nav animated:YES completion:nil];
}

-(void)searchClick{
    
}

-(void)categoryClick{
    
}

- (void)regionClick{

}
- (void)sortClick{
    
}
@end
