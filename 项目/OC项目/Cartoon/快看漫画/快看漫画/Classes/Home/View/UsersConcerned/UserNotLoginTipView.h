//
//  UserNotLoginTipView.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,tipOption) {
    tipOptionNotLogin,          //用户没有登录
    tipOptionNotConcerned,      //登录但没有作品
};

@interface UserNotLoginTipView : UIView

@property (nonatomic,copy) void (^loginOnClick)(UserNotLoginTipView *sender);

@property (nonatomic) tipOption tip;

+ (instancetype)makeUserNotLoginTipView;

@end
