//
//  LiveDownView.h
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/2.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LiveDownView;
@protocol LiveDownViewDelegate <NSObject>

@optional

- (void)liveDownView:(LiveDownView *)downView DidClickDownButtonViewName:(NSString *)name;

@end

@interface LiveDownView : UIScrollView

@property (nonatomic,strong) NSArray *tags;

@property (nonatomic,weak) id<LiveDownViewDelegate> downViewDelegate;
/**
 *  重新设置下拉列表选中的按钮
 */
- (void)selectButtonViewName:(NSString *)btnName;

@end
