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

@interface MainController()

@property (nonatomic, weak) NavMenu *categoryMenu;
@property (nonatomic, weak) NavMenu *regionMenu;
@property (nonatomic, weak) NavMenu *sortMenu;

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

@end
