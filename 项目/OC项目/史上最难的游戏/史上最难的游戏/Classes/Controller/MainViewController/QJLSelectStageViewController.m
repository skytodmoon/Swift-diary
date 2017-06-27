//
//  QJLSelectStageViewController.m
//  Game
//
//  Created by 金亮齐 on 16/7/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLSelectStageViewController.h"
#import "QJLStageListView.h"
#import "UIView+QJLImage.h"
#import "QJLPrepareViewController.h"
#import "PrefixHeader.pch"
#define kPrepareIdentifier @"prepare"

@interface QJLSelectStageViewController ()
{
    BOOL _hasNewData;
    int _newNum;
    BOOL _hasNewCount;
    int _newCount;
}

@property (nonatomic, strong) QJLStageListView *listView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (nonatomic, assign) NSInteger page;

@end

@implementation QJLSelectStageViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundImageWihtImageName:@"select_bg"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(newStageDidUnLock:) name:@"NewStageDidUnLock" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(newCount:) name:@"NewCount" object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (!self.listView) {
        __weak __typeof(self) weakSelf = self;
        self.listView = [[QJLStageListView alloc] init];
        
        self.listView.didChangeScrollPage = ^(int page) {
            weakSelf.pageControl.currentPage = page;
            weakSelf.page = page;
        };
        
        self.listView.didSelectedStageView = ^(QJLStage *stage) {
            [weakSelf performSegueWithIdentifier:kPrepareIdentifier sender:stage];
        };
        
        [self.view insertSubview:self.listView atIndex:0];
        
        self.page = [[[NSUserDefaults standardUserDefaults] objectForKey:@"lastPage"] integerValue];
        [self.listView setContentOffset:CGPointMake(ScreenWidth * self.page, 0) animated:NO];
    }
    
    if (_hasNewData) {
        
        if ((_newNum - 1) / 6 == self.page) {
            [self.listView reloadStageForNumber:_newNum];
            _hasNewData = NO;
        }
    }
    
    if (_hasNewCount) {
        [self.listView reloadStageForNumber:_newCount - 1];
        _hasNewCount = NO;
    }
}

- (void)setPage:(NSInteger)page {
    if (_hasNewData) {
        
        if (_page == page - 1 && _hasNewData) {
            [self.listView reloadStageForNumber:_newNum];
            _hasNewData = NO;
        }
    }
    
    _page = page;
    
    [[NSUserDefaults standardUserDefaults] setObject:@(page) forKey:@"lastPage"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:kPrepareIdentifier]) {
        QJLPrepareViewController *prepaerVC = segue.destinationViewController;
        prepaerVC.stage = (QJLStage *)sender;
    }
}

- (void)newCount:(NSNotification *)noti {
    _hasNewCount = YES;
    _newCount = [noti.object intValue];
}

- (void)newStageDidUnLock:(NSNotification *)noti {
    _hasNewData = YES;
    _newNum = [noti.object intValue];
}

@end
