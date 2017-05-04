//
//  QJLRareViewController.m
//  Game
//
//  Created by 金亮齐 on 16/7/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLRareViewController.h"
#import "QJLStageInfoManager.h"
#import "UIView+QJLImage.h"
@interface QJLRareViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation QJLRareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundImageWihtImageName:@"setting_bg"];
}

- (IBAction)unlockNextStage:(UIButton *)sender {
    
    sender.enabled = NO;
    
    NSString *title;
    
    if ([[QJLStageInfoManager sharedStageInfoManager] unlockNextStage]) {
        title = @"解锁成功";
    } else {
        title = @"已经全部解锁了";
    }
    
    self.titleLabel.text = title;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationController popToRootViewControllerAnimated:NO];
    });
}

- (IBAction)pause:(UIButton *)sender {
    
    [self.navigationController popToRootViewControllerAnimated:NO];
    
}


@end
