//
//  QJLIceView.h
//  Game
//
//  Created by 金亮齐 on 16/7/15.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLIceView : UIView
@property (nonatomic, copy) void(^failBlock)();
@property (nonatomic, copy) void(^successBlock)(int iceCount);
@property (nonatomic, copy) void(^passBlock)();
@property (nonatomic, assign) BOOL isPass;

- (void)showDottedLineView;

- (void)addIceWithIndex:(NSInteger)index;
@end
