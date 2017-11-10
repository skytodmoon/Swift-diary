//
//  RenQiBiaoShengCell.m
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "RenQiBiaoShengCell.h"
#import "topicInfoView.h"
#import "topicModel.h"
#import "UIView+Extension.h"
#import "WordsDetailViewController.h"

static NSUInteger itemCount = 3;

@interface RenQiBiaoShengCell ()

@property (nonatomic,copy) NSArray<topicInfoView *> *items;

@end

@implementation RenQiBiaoShengCell

- (void)setTopics:(NSArray *)topics {
    _topics = topics;
    
    [self.items enumerateObjectsUsingBlock:^(topicInfoView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.model = topics[idx];
    }];
    
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.contentView.frame = self.bounds;
    [topicInfoView jiuGongGeLayout:self.items WithMaxSize:self.contentView.bounds.size WithRow:1];
}

- (void)tap:(UITapGestureRecognizer *)tap {
    
    NSInteger index = [[tap view] tag];
    
    topicModel *md = [self.topics objectAtIndex:index];
    
    WordsDetailViewController *wdvc = [WordsDetailViewController new];
    
    wdvc.wordsID = md.ID.stringValue;
    
    [[self findResponderWithClass:[UINavigationController class]] pushViewController:wdvc animated:YES];
    
}

- (NSArray *)items {
    if (!_items) {
        
        NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:itemCount];
        
        for (NSInteger index = 0; index < itemCount; index++) {
            
            topicInfoView *view = [topicInfoView new];
            view.tag = index;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
            [view addGestureRecognizer:tap];
            [self.contentView addSubview:view];
            [arr addObject:view];
            
        }
        
        _items = arr;
    }
    return _items;
}


@end
