//
//  QJLPokerView.h
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, QJLPokerType) {
    QJLPokerTypeHearts = 0,   // 红桃
    QJLPokerTypeDiamonds = 1, // 方块
    QJLPokerTypeSpade = 2,    // 黑桃
    QJLPokerTypeClubs         // 梅花
};

@interface QJLPokerView : UIView

- (void)setPokerWithType:(QJLPokerType)type number:(int)number;
    
@end
