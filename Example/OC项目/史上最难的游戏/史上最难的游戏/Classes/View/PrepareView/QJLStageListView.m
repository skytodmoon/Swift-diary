//
//  QJLStageListView.m
//  Game
//
//  Created by 金亮齐 on 16/7/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLStageListView.h"
#import "QJLStage.h"
#import "QJLStageView.h"
#import "QJLStageInfoManager.h"
#import "PrefixHeader.pch"

@implementation QJLStageListView

- (instancetype)init {
    if (self = [super initWithFrame:ScreenBounds]) {
        self.contentSize = CGSizeMake(ScreenWidth * 4, ScreenHeight);
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.pagingEnabled = YES;
        self.delegate = self;
        
        NSArray *bgNames = @[@"select_easy_bg", @"select_normal_bg", @"select_hard_bg", @"select_insane_bg"];
        for (int i = 0; i < 4; i++) {
            QJLFullBackgroundView *listView = [[QJLFullBackgroundView alloc] initWithFrame:CGRectMake(i * ScreenWidth, 0, ScreenWidth, ScreenHeight)];
            [listView setBackgroundImageWihtImageName:bgNames[i]];
            [self addSubview:listView];
        }
        
        [self loadStageInfo];
    }
    
    return self;
}

- (void)reloadStageForNumber:(int)num {
    QJLStageView *stageView = (QJLStageView *)[self viewWithTag:100 + num - 1];
    QJLStage *newStage = stageView.stage;
    stageView.stage.userInfo = [[QJLStageInfoManager sharedStageInfoManager] stageInfoWithNumber:num];
    stageView.stage = newStage;
}

- (void)loadStageInfo {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"stages.plist" ofType:nil];
    NSArray *stageArr = [NSArray arrayWithContentsOfFile:path];
    
    CGFloat stageViewW = 120;
    CGFloat stageViewH = 100;
    CGFloat viewMaxgin = ScreenWidth - stageViewW * 2 - 25 * 2;
    CGFloat topMagin = iPhone5 ? 130 : 80;
    QJLStageInfoManager *manager = [QJLStageInfoManager sharedStageInfoManager];
    
    for (int i = 0; i < stageArr.count; i++) {
        QJLStage *stage = [QJLStage stageWithDict:stageArr[i]];
        stage.num = i + 1;
        stage.userInfo = [manager stageInfoWithNumber:i + 1];
        
        CGFloat scrollX = ((int)(i / 6)) * ScreenWidth;
        CGFloat startX = 25 + ((i % 6) / 3) * (stageViewW + viewMaxgin) + scrollX;
        CGFloat startY = topMagin + (i % 3) * (stageViewH + 30);
        
        QJLStageView *stageView = [QJLStageView stageViewWithStage:stage frame:CGRectMake(startX, startY, stageViewW, stageViewH)];
        stageView.tag = 100 + i;
        [self insertSubview:stageView atIndex:5];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(stageViewDidSelected:)];
        [stageView addGestureRecognizer:tap];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (self.didChangeScrollPage) {
        int page = (scrollView.contentOffset.x / ScreenWidth + 0.5);
        if (page < 0) page = 0;
        if (page > 3) page = 3;
        self.didChangeScrollPage(page);
    }
}

- (void)stageViewDidSelected:(UITapGestureRecognizer *)tap {
    if (self.didSelectedStageView) {
        [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundSelectedStage];
        self.didSelectedStageView(((QJLStageView *)tap.view).stage);
    }
}

@end
