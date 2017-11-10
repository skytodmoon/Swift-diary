//
//  CartoonFlooterView.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CartoonFlooterViewDelegate <NSObject>

@optional

- (void)commentButtonAction;    //开启评论

- (void)previousPage;   //上一篇

- (void)nextPage;   //下一篇

- (void)showShareView;  //显示分享视图

@end

@class comicsModel;

static const CGFloat CartoonFlooterViewHeight = 200.f;

@interface CartoonFlooterView : UIView

@property (nonatomic,weak) id<CartoonFlooterViewDelegate> delegate;

@property (nonatomic,strong) comicsModel *model;


+ (instancetype)makeCartoonFlooterView;

@end
