//
//  FirstPageCell.h
//  日日煮
//
//  Created by 金亮齐 on 2017/3/21.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstPageCell : UICollectionViewCell

/** 菜图片 */
@property (nonatomic, strong) UIImageView *imageV;

/** 题目 */
@property (nonatomic, strong) UILabel *labelTitle;

/** 描述 */
@property (nonatomic, strong) UILabel *labelDec;

/** 更新时间 */
@property (nonatomic, strong) UILabel *labelReNewTime;

/** 分享人数 */
@property (nonatomic, strong) UILabel *labelShareCount;

/** 烹调时长 */
@property (nonatomic, strong) UILabel *labelCookTime;

/** 点击人数 */
@property (nonatomic, strong) UILabel *labelClickCount;

@end
