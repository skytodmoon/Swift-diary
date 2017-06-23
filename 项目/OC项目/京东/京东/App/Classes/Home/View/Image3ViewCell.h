//
//  Image3ViewCell.h
//  京东
//
//  Created by 金亮齐 on 2017/6/21.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Model.h"
@interface Image3ViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *ImageView;
/// 根据数据模型来显示内容
- (void)showInfo:(Model *)model;

@end
