//
//  UserNotLoginTipView.m
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "UserNotLoginTipView.h"


@interface UserNotLoginTipView ()
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginBtnWidth;

@end

@implementation UserNotLoginTipView

- (void)setTip:(tipOption)tip {
    if (tip == tipOptionNotLogin) {
        
        self.tipLabel.text = @"没登录,超多精彩内容看不鸟";
        
        [self setLoginBtnImageWithName:@"ic_home_empty_login_normal_120x49_" pressName:@"ic_home_empty_login_pressed_120x49_"];
        
        self.loginBtnWidth.constant = 120;
        
    }else if (tip == tipOptionNotConcerned) {
        
        self.tipLabel.text = @"你还没有关注哦";
        
        [self setLoginBtnImageWithName:@"ic_home_empty_random_normal_150x49_" pressName:@"ic_home_empty_random_pressed_150x49_"];
        
        self.loginBtnWidth.constant = 150;
    }
    
    [self layoutIfNeeded];
}


- (void)setLoginBtnImageWithName:(NSString *)name pressName:(NSString *)pressName{
    
    [self.loginBtn setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [self.loginBtn setImage:[UIImage imageNamed:pressName] forState:UIControlStateHighlighted];
}

+ (instancetype)makeUserNotLoginTipView {
    return [[[NSBundle mainBundle] loadNibNamed:@"UserNotLoginTipView" owner:nil options:nil] firstObject];
}

- (IBAction)login:(id)sender {
    
    if (self.loginOnClick) {
        self.loginOnClick(self);
    }
}

@end
