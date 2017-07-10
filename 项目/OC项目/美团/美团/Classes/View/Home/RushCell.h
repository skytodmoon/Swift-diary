//
//  RushCell.h
//  美团
//
//  Created by 金亮齐 on 2017/7/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RushDelegate <NSObject>

@optional
-(void)didSelectRushIndex:(NSInteger )index;

@end

@interface RushCell : UITableViewCell

@property(nonatomic, strong) NSMutableArray *rushData;


@property(nonatomic, assign) id<RushDelegate> delegate;


@end
