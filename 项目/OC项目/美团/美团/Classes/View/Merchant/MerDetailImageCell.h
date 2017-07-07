//
//  MerDetailImageCell.h
//  美团
//
//  Created by 金亮齐 on 2017/7/4.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MerDetailImageCell : UITableViewCell
@property(nonatomic, strong) NSString *BigImgUrl;
@property(nonatomic, strong) NSString *SmallImgUrl;
@property(nonatomic, strong) NSNumber *score;
@property(nonatomic, strong) NSNumber *avgPrice;
@property(nonatomic, strong) NSString *shopName;

@end
