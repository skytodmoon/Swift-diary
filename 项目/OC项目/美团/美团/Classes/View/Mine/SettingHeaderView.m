//
//  SettingHeaderView.m
//  美团
//
//  Created by 金亮齐 on 2017/7/18.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "SettingHeaderView.h"

@implementation SettingHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(sureLogin:) name:@"QQLogin" object:nil];
        
        self.frame = CGRectMake(0, 0, screen_width, 0.6*screen_width);
        self.backgroundColor = [UIColor colorWithRed:186/255.0f green:71/255.0f blue:58/255.0f alpha:1];
        
        UIButton *logoutBtn = [[UIButton alloc]initWithFrame:CGRectMake(screen_width-60, 30, 50, 20)];
        [logoutBtn addTarget:self action:@selector(logoutBtnClick) forControlEvents:UIControlEventTouchUpInside];
        logoutBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [logoutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [logoutBtn setTitle:@"注销" forState:UIControlStateNormal];
        [self addSubview:logoutBtn];
        
        UIImageView *imageV = [[UIImageView alloc]init];
        imageV.frame = CGRectMake(self.frame.size.width/2-40, self.frame.size.height/2-40, 80, 80);
        imageV.image = [UIImage imageNamed:@"comment_profile_default"];
        [self addSubview:imageV];
        [imageV.layer setCornerRadius:40];
        imageV.clipsToBounds = YES;
        imageV.userInteractionEnabled = YES;
        self.photoimageV = imageV;
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageV.frame)+10, screen_width, 20)];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:16];
        label.text = @"立即登录";
        label.textColor = [UIColor whiteColor];
        [self addSubview:label];
        label.userInteractionEnabled = YES;
        self.nameL = label;
        
        NSString *loginImage = [[NSUserDefaults standardUserDefaults]objectForKey:@"LOGINIMAGE"];
        NSString *loginName = [[NSUserDefaults standardUserDefaults]objectForKey:@"LOGINNAME"];
        if (loginImage.length != 0 && loginName.length != 0) {
            [imageV sd_setImageWithURL:[NSURL URLWithString:loginImage]];
            label.text = loginName;
        }
        
        UIButton *cover = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width/2-40, self.frame.size.height/2-40, 80, 110)];
        [cover addTarget:self action:@selector(countLogin) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cover];
        

    }
    return self;
}

#pragma mark - 登录
- (void)countLogin
{
    if ([self.nameL.text isEqualToString:@"立即登录"]){
        if (self.loginBlock) {
            self.loginBlock();
        }
    }else{
        
    }
}

#pragma mark - 最终登录方式
- (void)sureLogin:(NSNotification *)noti
{

}

@end
