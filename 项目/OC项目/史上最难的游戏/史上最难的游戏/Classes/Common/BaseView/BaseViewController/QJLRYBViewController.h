//
//  QJLRYBViewController.h
//  Game
//
//  Created by 金亮齐 on 16/7/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLBaseGameViewController.h"

@interface QJLRYBViewController : QJLBaseGameViewController

@property (strong, nonatomic) UIImageView *redImageView;
@property (strong, nonatomic) UIImageView *yellowImageView;
@property (strong, nonatomic) UIImageView *blueImageView;

@property (strong, nonatomic) UIButton    *redButton;
@property (strong, nonatomic) UIButton    *yellowButton;
@property (strong, nonatomic) UIButton    *blueButton;

@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, strong) NSArray *buttonImageNames;

- (void)setButtonsIsActivate:(BOOL)isActivate;

- (void)setButtonImage:(UIImage *)image
      contenEdgeInsets:(UIEdgeInsets)insets;

- (void)removeAllImageView;

- (void)addButtonsActionWithTarget:(id)target
                            action:(SEL)action
                  forControlEvents:(UIControlEvents)forControlEvents;

@end
