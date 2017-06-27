//
//  QJLStage15View.m
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//


#import "QJLStage15View.h"
#import "QJLStage15RowView.h"
#import "PrefixHeader.pch"

#define kJumpY 95
#define kJumpX 110
#define kJumpTwoX 210

typedef NS_ENUM(NSInteger, QJLStage15PeoplePositonType) {
    QJLStage15PeoplePositonTypeLeft = 0,
    QJLStage15PeoplePositonTypeMiddle = 1,
    QJLStage15PeoplePositonTypeRight
};

@interface QJLStage15View ()
{
    int _count;
    CGFloat _rowHeight;
    int _rowCount;
    QJLStage15PeoplePositonType _willJumpToType;
    QJLStage15RowView *_tmpNextRow;
    BOOL _showDestination;
}

@property (strong, nonatomic) NSMutableArray *rowArray;
@property (nonatomic, strong) UIImageView *peopleIV;
@property (nonatomic, assign) QJLStage15PeoplePositonType currentPositionType;
@property (nonatomic, assign) int addTag;

@end

@implementation QJLStage15View

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - ScreenWidth / 3)]) {
        self.rowArray = [NSMutableArray array];
        _addTag = 2;
        self.currentPositionType = QJLStage15PeoplePositonTypeMiddle;
        
        QJLStage15RowView *row = [QJLStage15RowView viewFromNib];
        _rowHeight = row.frame.size.height;
        row.frame = CGRectMake(0, self.frame.size.height - _rowHeight + 30, ScreenWidth, _rowHeight);
        [row showRowWithIsShowWave:NO showFinish:NO isFrist:NO];
        row.tag = 1001;
        [self addSubview:row];
        [self.rowArray addObject:row];
        
        QJLStage15RowView *row2 = [QJLStage15RowView viewFromNib];
        row2.frame = CGRectMake(0, CGRectGetMinY(row.frame) - _rowHeight, ScreenWidth, _rowHeight);
        [row2 showRowWithIsShowWave:YES showFinish:NO isFrist:NO];
        [self addSubview:row2];
        row2.tag = 1000;
        [self.rowArray addObject:row2];
        
        QJLStage15RowView *row3 = [QJLStage15RowView viewFromNib];
        row3.frame = CGRectMake(0, CGRectGetMinY(row2.frame) - _rowHeight, ScreenWidth, _rowHeight);
        [row3 showRowWithIsShowWave:NO showFinish:NO isFrist:YES];
        [self addSubview:row3];
        [self.rowArray addObject:row3];
        
        self.peopleIV = [[UIImageView alloc] initWithFrame:CGRectMake(kCountStartX(87), 165, 87, 106)];
        self.peopleIV.image = [UIImage imageNamed:@"18_hold-iphone4"];
        [self addSubview:self.peopleIV];
    }
    
    return self;
}

- (BOOL)jumpToNextRowWithIndex:(int)index {
    
    BOOL result = NO;
    
    QJLStage15RowView *nextRow = (QJLStage15RowView *)[self viewWithTag:1000 + _rowCount];
    _tmpNextRow = nextRow;
    if (index == 0 && !nextRow.leftWoodIV.hidden) {
        result = YES;
        _willJumpToType = QJLStage15PeoplePositonTypeLeft;
    } else if (index == 1 && !nextRow.middleWoodIV.hidden) {
        result = YES;
        _willJumpToType = QJLStage15PeoplePositonTypeMiddle;
    } else if (index == 2 && !nextRow.rightWoodIV.hidden) {
        result = YES;
        _willJumpToType = QJLStage15PeoplePositonTypeRight;
    }
    
    if (result) {
        [self jumpToIndex:index fail:NO animationFinish:^{
            self.buttonActivate();
            [_tmpNextRow startWoodAnimation];
            [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundJumpMixName];
            [self showNextRow];
        }];
    } else {
        [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundDropWaterName];
        [self jumpToIndex:index fail:YES animationFinish:^{
            self.peopleIV.hidden = NO;
            self.buttonActivate();
        }];
    }
    
    if (_rowCount == 32 && result) {
        self.passStage();
    }
    
    return result;
}

- (void)jumpToIndex:(int)index fail:(BOOL)fail animationFinish:(void(^)())finish {
    CGAffineTransform transform;
    UIImage *jumpImage;
    
    if (self.currentPositionType == QJLStage15PeoplePositonTypeLeft) {
        if (index == 0) {
            transform = CGAffineTransformMakeTranslation(0, kJumpY);
            jumpImage = [UIImage imageNamed:@"18_jump-iphone4"];
        } else if (index == 1) {
            transform = CGAffineTransformMakeTranslation(kJumpX, kJumpY);
            jumpImage = [UIImage imageNamed:@"18_jumpR-iphone4"];
        } else {
            transform = CGAffineTransformMakeTranslation(kJumpTwoX, kJumpY);
            jumpImage = [UIImage imageNamed:@"18_jumpR-iphone4"];
        }
    } else if (self.currentPositionType == QJLStage15PeoplePositonTypeMiddle) {
        if (index == 0) {
            transform = CGAffineTransformMakeTranslation(-kJumpX, kJumpY);
            jumpImage = [UIImage imageNamed:@"18_jumpL-iphone4"];
        } else if (index == 1) {
            transform = CGAffineTransformMakeTranslation(0, kJumpY);
            jumpImage = [UIImage imageNamed:@"18_jump-iphone4"];
        } else {
            transform = CGAffineTransformMakeTranslation(kJumpX, kJumpY);
            jumpImage = [UIImage imageNamed:@"18_jumpR-iphone4"];
        }
    } else {
        if (index == 0) {
            transform = CGAffineTransformMakeTranslation(-kJumpTwoX, kJumpY);
            jumpImage = [UIImage imageNamed:@"18_jumpL-iphone4"];
        } else if (index == 1) {
            transform = CGAffineTransformMakeTranslation(-kJumpX, kJumpY);
            jumpImage = [UIImage imageNamed:@"18_jumpL-iphone4"];
        } else {
            transform = CGAffineTransformMakeTranslation(0, kJumpY);
            jumpImage = [UIImage imageNamed:@"18_jump-iphone4"];
        }
    }
    
    [UIView animateWithDuration:0.15 animations:^{
        self.peopleIV.transform = transform;
        self.peopleIV.image = jumpImage;
    } completion:^(BOOL finished) {
        
        if (!fail) {
            self.peopleIV.transform = CGAffineTransformIdentity;
            self.peopleIV.image = [UIImage imageNamed:@"18_hold-iphone4"];
            self.currentPositionType = _willJumpToType;
            [self movePeople];
            finish();
        } else {
            self.peopleIV.hidden = YES;
            self.peopleIV.transform = CGAffineTransformIdentity;
            self.peopleIV.image = [UIImage imageNamed:@"18_hold-iphone4"];
            [self showSprayWithIndex:index finish:^{
                finish();
            }];
        }
    }];
}

- (void)showSprayWithIndex:(int)index finish:(void(^)())finish {
    UIImageView *sprayIV = [UIImageView new];
    sprayIV.animationRepeatCount = 1;
    sprayIV.animationImages = @[[UIImage imageNamed:@"18_water1-iphone4"], [UIImage imageNamed:@"18_water2-iphone4"], [UIImage imageNamed:@"18_water1-iphone4"]];
    sprayIV.animationDuration = 0.35;
    
    if (index == 0) {
        sprayIV.frame = CGRectMake(0, 325, 100, 58);
    } else if (index == 1) {
        sprayIV.frame = CGRectMake(kCountStartX(100) - 7, 325, 100, 58);
    } else {
        sprayIV.frame = CGRectMake(220, 325, 100, 58);
    }
    
    [self addSubview:sprayIV];
    [sprayIV startAnimating];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.35 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        finish();
        [sprayIV removeFromSuperview];
    });
}

- (void)movePeople {
    CGRect pFrame;
    if (self.currentPositionType == QJLStage15PeoplePositonTypeLeft) {
        pFrame = CGRectMake(25, 165, 87, 106);
    } else if (self.currentPositionType == QJLStage15PeoplePositonTypeMiddle) {
        pFrame = CGRectMake(kCountStartX(87) - 4, 165, 87, 106);
    } else {
        pFrame = CGRectMake(kCountStartX(87) + 95, 165, 87, 106);
    }
    self.peopleIV.frame = pFrame;
}

- (void)showNextRow {

    for (QJLStage15RowView *row in self.rowArray) {
        CGRect rowFrame = row.frame;
        row.frame = CGRectMake(0, rowFrame.origin.y - _rowHeight, ScreenWidth, _rowHeight);
        if (CGRectGetMaxY(row.frame) < 0) {
            [row removeFromSuperview];
            [self.rowArray removeLastObject];
        }
    }
    
    if (_count == 31) {
         _rowCount++;
        return;
    }
    _rowCount++;
    
    QJLStage15RowView *row = [QJLStage15RowView viewFromNib];
    row.tag = 1000 + _addTag;
    _addTag++;
    
    row.frame = CGRectMake(0, self.frame.size.height - row.frame.size.height + 30, ScreenWidth, row.frame.size.height);
    
    if (_count % 3 == 0 && _count != 30) {
        [row showRowWithIsShowWave:YES showFinish:NO isFrist:NO];
    } else if (_count % 3 != 0 && _count != 30) {
        [row showRowWithIsShowWave:NO showFinish:NO isFrist:NO];
    } else {
        [row showRowWithIsShowWave:YES showFinish:YES isFrist:NO];
    }
    
    [self addSubview:row];
    [self.rowArray insertObject:row atIndex:0];
    
    [self bringSubviewToFront:self.peopleIV];
    
    _count++;
}

- (void)resumeData {
    _rowCount = 2;
}

@end
