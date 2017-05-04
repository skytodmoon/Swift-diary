//
//  QJLStateView.h
//  Game
//
//  Created by 金亮齐 on 16/7/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,QJLResultStateType) {
    QJLResultStateTypeOK = 0,
    QJLResultStateTypeGood = 1,
    QJLResultStateTypeGreat = 2,
    QJLResultStateTypePerfect = 3,
    QJLResultStateTypeBad = 4
};

@interface QJLStateView : UIView

@property (nonatomic, assign) QJLResultStateType type;

- (void)showStateViewWithType:(QJLResultStateType)type;
- (void)hideStateView;

- (void)showStateViewWithType:(QJLResultStateType)type stageViewHiddenFinishBlock:(void (^)(void))stageViewHiddenFinishBlock;

- (void)showBadStateWithFinish:(void(^)())finish;

- (void)removeData;

@end
