//
//  MerchantFilterView.h
//  美团
//
//  Created by 金亮齐 on 2017/7/3.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MerchantFilterDelegate <NSObject>

@optional
/**
 *  点击tableview，过滤id
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath withId:(NSNumber *)ID withName:(NSString *)name;

@end


@interface MerchantFilterView : UIView

@property(nonatomic, strong) UITableView *tableViewOfGroup;
@property(nonatomic, strong) UITableView *tableViewOfDetail;

@property(nonatomic, assign) id<MerchantFilterDelegate> delegate;

@end
