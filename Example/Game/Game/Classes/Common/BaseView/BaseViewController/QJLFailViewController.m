//
//  QJLFailViewController.m
//  Game
//
//  Created by 金亮齐 on 16/7/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLFailViewController.h"
#import "QJLPrepareViewController.h"
#import "QJLStageInfoManager.h"
#import "QJLSelectStageViewController.h"
#import "PrefixHeader.pch"

typedef void(^RetryButtonClickBlock)();

@interface QJLFailViewController ()

@property (nonatomic, copy) RetryButtonClickBlock retryButtonClickBlock;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation QJLFailViewController

+ (instancetype)initWithStage:(QJLStage *)stage retryButtonClickBlock:(void (^)())retryButtonClickBlock {
    QJLFailViewController *failVC = [[QJLFailViewController alloc] init];
    failVC.stage = stage;
    failVC.retryButtonClickBlock = retryButtonClickBlock;
    failVC.titleLabel.text = stage.fail;
    return failVC;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.titleLabel.text = self.stage.fail;
}

- (IBAction)buttonClick:(UIButton *)sender {
    if (sender.tag == 10) {
        for (UIViewController *vc in self.navigationController.viewControllers) {
            if ([vc isKindOfClass:[QJLSelectStageViewController class]]) {
                [self.navigationController popToViewController:vc animated:NO];
                return;
            }
        }
    } else if (sender.tag == 11) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"失败原因" message:self.stage.fail delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    } else if (sender.tag == 12) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:kAuthorGithubURLString]];
    } else if (sender.tag == 13) {
        if (self.retryButtonClickBlock) {
            self.retryButtonClickBlock();
        }
    }
}

@end
