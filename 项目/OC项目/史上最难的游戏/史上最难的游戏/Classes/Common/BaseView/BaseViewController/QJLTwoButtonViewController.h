//
//  QJLTwoButtonViewController.h
//  Game
//
//  Created by 金亮齐 on 16/7/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLBaseGameViewController.h"

@interface QJLTwoButtonViewController : QJLBaseGameViewController

@property (nonatomic, strong) UIImageView *backgroundIV;

@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

- (void)setButtonActivate:(BOOL)isActivate;

@end
