//
//  QJLBackViewController.m
//  Game
//
//  Created by 金亮齐 on 16/7/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLBackViewController.h"
#import "QJLSoundToolManager.h"
@interface QJLBackViewController ()

@end

@implementation QJLBackViewController

- (void)loadView {
    [super loadView];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 50, 48)];
    backButton.adjustsImageWhenHighlighted = NO;
    [backButton setBackgroundImage:[UIImage imageNamed:@"bt_back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)backButtonClick {
    [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundCliclName];
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}


@end
