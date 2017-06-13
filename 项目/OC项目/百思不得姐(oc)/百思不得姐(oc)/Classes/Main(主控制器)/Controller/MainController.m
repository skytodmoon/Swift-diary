//
//  MainController.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "MainController.h"
#import "MeViewController.h"
#import "FollowViewController.h"
#import "EssenceViewController.h"
#import "NewViewController.h"
#import "NavigationViewController.h"
#import "TabBar.h"

@interface MainController ()

@end

@implementation MainController

+ (void)initialize
{
    //appearance 可是该对象对应的类型属性进行统一
    UITabBarItem *item = [UITabBarItem appearance];
    //设置普通状态下字体富文本属性
    NSMutableDictionary *normalDic = [NSMutableDictionary dictionary];
    normalDic[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    normalDic[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:normalDic forState:UIControlStateNormal];
    //设置点击状态下字体富文本属性
    NSMutableDictionary *selectedDic = [NSMutableDictionary dictionary];
    selectedDic[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [item setTitleTextAttributes:selectedDic forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置底部控制器
    [self setupChildViewController];
    
    //替换系统原有的tabBar
    [self setupTabBar];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//设置底部TabBar控制器上的按钮
- (void)setupChildViewController
{
    //精华
    [self addOneChildViewController:[[EssenceViewController alloc]init] title:@"精华" image:@"tabBar_essence_icon" selected:@"tabBar_essence_click_icon"];
    
    //新帖
    [self addOneChildViewController:[[NewViewController alloc]init] title:@"最新" image:@"tabBar_new_icon" selected:@"tabBar_new_click_icon"];
    
    //关注
    [self addOneChildViewController:[[FollowViewController alloc]init] title:@"关注" image:@"tabBar_friendTrends_icon" selected:@"tabBar_friendTrends_click_icon"];
    
    //我
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MeViewController" bundle:nil];
    MeViewController *me = [sb instantiateInitialViewController];
    [self addOneChildViewController:me title:@"我" image:@"tabBar_me_icon" selected:@"tabBar_me_click_icon"];
    
}

//设置公用控制器
- (void)addOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selected:(NSString *)selecetedImage
{
    vc.tabBarItem.title = title;
    //    vc.view.backgroundColor = [UIColor redColor];
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selecetedImage];
    //自定义NavigationViewController用来包装
    NavigationViewController *nav = [[NavigationViewController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
}

//因为tabBar属于私有属性不能直接修改，所以采取用KVC的办法修改里面的TabBar
- (void)setupTabBar
{
    [self setValue:[[TabBar alloc]init] forKey:@"tabBar"];
}

@end
