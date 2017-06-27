//
//  QJLStage13BottomView.h
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, QJLStage13BottomType) {
    QJLStage13BottomTypeNone = 0,
    QJLStage13BottomTypePeople,
    QJLStage13BottomTypeTick
};

@interface QJLStage13BottomView : UIView

- (void)changeBottomImageViewWihtIndex:(NSInteger)index type:(QJLStage13BottomType)type;

- (void)showPeopleImageViewWithIndex:(NSInteger)index;
- (void)hidePeopleImageViewWithIndex:(NSInteger)index;

- (void)cleanData;

@end
