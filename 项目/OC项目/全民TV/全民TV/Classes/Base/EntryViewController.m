//
//  EntryViewController.m
//  全民TV
//
//  Created by 金亮齐 on 2017/7/24.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "EntryViewController.h"
#import "AppDelegate.h"

@interface EntryViewController ()

@end

@implementation EntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin;
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //根据条件进入相应视图
    //test code
    [self enterViewController];
}

/**
 *  根据条件进入相应视图
 */
- (void)enterViewController
{
    [[AppDelegate shareAppDelegate] showMainViewController];

}

@end
