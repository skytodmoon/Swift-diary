//
//  SettingHeaderView.h
//  美团
//
//  Created by 金亮齐 on 2017/7/18.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingHeaderView : UIView
//头像
@property (nonatomic , weak) UIImageView *photoimageV;
//昵称
@property (nonatomic , weak) UILabel *nameL;
@property (nonatomic , copy) void(^loginBlock)();

@end
