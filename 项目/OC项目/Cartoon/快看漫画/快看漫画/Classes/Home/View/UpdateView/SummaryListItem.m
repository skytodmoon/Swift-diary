//
//  SummaryListItem.m
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "SummaryListItem.h"
#import "UIView+Extension.h"

@interface SummaryListItem ()

@property (nonatomic,weak) WordsListView *slv;

@end

@implementation SummaryListItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        WordsListView *slv = [[WordsListView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
        [self.contentView addSubview:slv];
        
        self.slv = slv;
        
        self.backgroundColor = slv.backgroundColor;
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.slv.frame = self.bounds;
    
}

- (void)setHasNotBeenUpdated:(BOOL)hasNotBeenUpdated {
    self.slv.hasNotBeenUpdated = hasNotBeenUpdated;
}

- (void)setUrlString:(NSString *)urlString {
    self.slv.urlString = urlString;
}
@end
