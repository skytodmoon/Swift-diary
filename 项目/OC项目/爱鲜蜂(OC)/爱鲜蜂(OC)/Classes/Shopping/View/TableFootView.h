//
//  TableFootView.h
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TableFootViewDelegate <NSObject>
- (void)didTableFootViewCommit;
@end

@interface TableFootView : UIView
@property (nonatomic, weak) id<TableFootViewDelegate>delegate ;
@property (nonatomic, assign) CGFloat sumMoney;

@end
