//
//  LiveTopView.h
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/2.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LiveTopView;
@protocol LiveTopViewDelegate <NSObject>

@optional
- (void)liveTopView:(LiveTopView *)topView didClickButtonTagNumber:(NSInteger)tagNumber;

- (void)liveTopView:(LiveTopView *)topView didClickButtonTitle:(NSString *)title;
@end

@interface LiveTopView : UIView

@property (nonatomic,strong) NSArray *tags;

@property (nonatomic,weak) id<LiveTopViewDelegate> delegate;

@end
