//
//  QJLLoginRegisterController.m
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/7.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLLoginRegisterController.h"
#import "UIView+QJLExtension.h"

@interface QJLLoginRegisterController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginViewLeftMargin;

@property (weak, nonatomic) IBOutlet UIImageView *bgView;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (weak, nonatomic) IBOutlet UITextField *phoneField;

@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation QJLLoginRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showLoginOrRegister:(UIButton *)sender {
    //退出键盘
    [self.view endEditing:YES];
    
    if (self.loginViewLeftMargin.constant == 0) { //显示注册界面
        self.loginViewLeftMargin.constant = -self.view.width;
        sender.selected = YES;
    } else {
        self.loginViewLeftMargin.constant = 0;
        sender.selected = NO;
    }
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutSubviews];
    }];
}

- (IBAction)exitButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(IBAction)onButtonClick:(UIButton *)sender{
    
    switch ([sender tag]) {
        case 0:{
            NSLog(@"点击了QQ");
            break;
        }
        case 1:{
            NSLog(@"点击了微博");
            break;
        }
        case 2:{
            NSLog(@"点击了腾讯微博");
            break;
        }
        default:
            break;
    }
}
@end
