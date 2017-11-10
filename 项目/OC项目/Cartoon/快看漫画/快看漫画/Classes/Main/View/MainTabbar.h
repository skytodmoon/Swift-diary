//
//  MainTabbar.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTabbar : UIView

@property (nonatomic,assign) NSInteger selectItem;

@property (nonatomic,readonly) NSInteger cuurentSelectIndex;

@property (nonatomic,copy) void (^selectAtIndex)(UIButton *btn,NSInteger index);

- (void)addItemWithImageNames:(NSArray *)names;

@end
