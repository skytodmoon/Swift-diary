//
//  QJLStage12BottomView.h
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, QJLStage12BottomViewType) {
    QJLStage12BottomViewTypeNormal = 0,
    QJLStage12BottomViewTypeFail,
    QJLStage12BottomViewTypeSucess
};

@interface QJLStage12BottomView : UIView

- (void)changeBottomWihtIndex:(NSInteger)index imageType:(QJLStage12BottomViewType)imageType;

@end
