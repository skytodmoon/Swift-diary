//
//  KindFilterCell.h
//  美团
//
//  Created by 金亮齐 on 2017/7/4.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MerCateGroupModel.h"

@interface KindFilterCell : UITableViewCell

@property(strong,nonatomic) MerCateGroupModel *groupM;


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withFrame:(CGRect)frame;

@end
