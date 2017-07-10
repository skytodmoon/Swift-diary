//
//  DiscountCell.h
//  美团
//
//  Created by 金亮齐 on 2017/7/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DiscountDelegate <NSObject>

@optional
-(void)didSelectUrl:(NSString *)urlStr withType:(NSNumber *)type withId:(NSNumber *)ID withTitle:(NSString *)title;

@end

@interface DiscountCell : UITableViewCell
/**
 *  懒的写复用的view了，改用for创建
 */

/**
 *  接收set方式传参
 */
@property(nonatomic, strong) NSMutableArray *discountArray;

@property(nonatomic, assign) id<DiscountDelegate> delegate;

@end
