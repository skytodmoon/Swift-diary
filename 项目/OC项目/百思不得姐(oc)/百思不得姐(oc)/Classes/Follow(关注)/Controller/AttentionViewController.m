//
//  AttentionViewController.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//


#import "AttentionViewController.h"
#import "LoginRegisterViewController.h"
#import "ResigeringViewController.h"
@interface AttentionViewController ()

@end

@implementation AttentionViewController


//弹出登录页面
- (IBAction)loginBtn:(id)sender {
    LoginRegisterViewController *login = [[LoginRegisterViewController alloc]init];
    [self.navigationController presentViewController:login animated:YES completion:nil];
}


//弹出注册页面
- (IBAction)registerBtn:(id)sender {
   
    ResigeringViewController *resiger = [[ResigeringViewController alloc]init];
    [self.navigationController presentViewController:resiger animated:YES completion:nil];
    
}

@end
