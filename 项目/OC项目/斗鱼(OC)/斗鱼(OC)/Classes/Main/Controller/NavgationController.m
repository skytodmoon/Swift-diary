//
//  NavgationController.m
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/1.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "NavgationController.h"
#import "LivePlayViewController.h"

@interface NavgationController ()<UIGestureRecognizerDelegate>

@end

@implementation NavgationController

+ (void)initialize {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //MARK: - 如果滑动移除控制器的功能失效，清空代理（让控制器重新设置这个功能）
    //MARK: - self.interactivePopGestureRecognizer.delegate = nil;
    
    UIGestureRecognizer *gesture = self.interactivePopGestureRecognizer;
    gesture.enabled = NO;
    UIView *gestureView = gesture.view;
    
    UIPanGestureRecognizer *popRecognizer = [[UIPanGestureRecognizer alloc] init];
    
    popRecognizer.delegate = self;
    popRecognizer.maximumNumberOfTouches = 1;
    [gestureView addGestureRecognizer:popRecognizer];
    
    /*** 获取系统手势的target数组 */
    NSMutableArray *_targets = [gesture valueForKey:@"_targets"];
    /*** 获取它的唯一对象，我们知道它是一个叫UIGestureRecognizerTarget的私有类，它有一个属性叫_target */
    id gestureRecognizerTarget = [_targets firstObject];
    /*** 获取_target:_UINavigationInteractiveTransition，它有一个方法叫handleNavigationTransition:*/
    id navigationInteractiveTransition = [gestureRecognizerTarget valueForKey:@"_target"];
    /***  通过前面的打印，我们从控制台获取出来它的方法签名。 */
    SEL handleTransition = NSSelectorFromString(@"handleNavigationTransition:");
    /***  创建一个与系统一模一样的手势，我们只把它的类改为UIPanGestureRecognizer */
    [popRecognizer addTarget:navigationInteractiveTransition action:handleTransition];
}

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    /***  这里有两个条件不允许手势执行，1、当前控制器为根控制器；2、如果这个push、pop动画正在执行（私有属性） */
    if ([gestureRecognizer translationInView:gestureRecognizer.view].x < 0 || [gestureRecognizer translationInView:gestureRecognizer.view].y > 0 || [gestureRecognizer translationInView:gestureRecognizer.view].y < 0) {
        return NO;
    }
    
    if ([self.topViewController isKindOfClass:[LivePlayViewController class]]) {
        return NO;
    }
    return self.viewControllers.count != 1 && ![[self valueForKey:@"_isTransitioning"] boolValue];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //MARK: - push进来的不是第一个子控制器
    if (self.childViewControllers.count > 0) {
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [backBtn setTitle:@"返回" forState:UIControlStateNormal];
        [backBtn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backBtn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
        backBtn.bounds = CGRectMake(0, 0, 70, 30);
        backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    
    //MARK: - 调用super的push方法放到后面，让viewcontroller可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
    
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

@end
