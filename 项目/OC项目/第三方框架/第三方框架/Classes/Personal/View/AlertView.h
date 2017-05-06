//
//  AlertView.h
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/14.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    AlertViewBtnTypeWeChat,
    AlertViewBtnTypeFriend,
    AlertViewBtnTypeZone,
    AlertViewBtnTypeQQ
}AlertViewBtnType;

@class AlertView;
@protocol AlertViewDelegate <NSObject>

@optional

/**
 *  设置按钮点击事件
 *
 *  @param alertView
 *  @param btnType   按钮类型
 */
- (void)alertView:(AlertView *)alertView  didSelectedBtn:(AlertViewBtnType )btnType;

@end

@interface AlertView : UIView

@property(nonatomic,weak) id<AlertViewDelegate>delegate;

@end
