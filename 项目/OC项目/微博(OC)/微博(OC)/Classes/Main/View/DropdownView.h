//
//  DropdownView.h
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/12.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DropdownView;
@protocol DropdownViewDelegate <NSObject>

@optional
- (void)dropdownMenuDidDismiss:(DropdownView *)menu;
- (void)dropdownMenuDidShow:(DropdownView *)menu;
@end

@interface DropdownView : UIView

+(instancetype)menu;
/**
 *  显示
 */
- (void)showFrom:(UIView *)from;
/**
 *  销毁
 */
- (void)dismiss;

/**
 *  内容
 */
@property (nonatomic, strong) UIView *content;
/**
 *  内容控制器
 */
@property (nonatomic, strong) UIViewController *contentController;
@property (nonatomic,weak) id <DropdownViewDelegate> delegate;

@end
