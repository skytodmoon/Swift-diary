//
//  LiveDownButtonView.h
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/2.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tag.h"

@interface LiveDownButtonView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *tagIconView;

@property (weak, nonatomic) IBOutlet UILabel *tagNameLabel;

@property (weak, nonatomic) IBOutlet UIImageView *checkIconView;


+ (instancetype)downButtonView;


@end
