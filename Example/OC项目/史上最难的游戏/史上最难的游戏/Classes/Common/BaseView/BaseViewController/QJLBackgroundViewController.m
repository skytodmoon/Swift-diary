//
//  QJLBackgroundViewController.m
//  Game
//
//  Created by 金亮齐 on 16/7/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLBackgroundViewController.h"

@interface QJLBackgroundViewController ()

@end

@implementation QJLBackgroundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.bgImageView];
    
}

@end
