//
//  NavMenu.h
//  美团iPad
//
//  Created by 金亮齐 on 2017/7/19.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavMenu : UIView

+ (instancetype)navMenu;

@property (weak, nonatomic) IBOutlet UIButton *clickBtn;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *subTitle;


- (void)addTarget:(id)target action:(SEL)action;

@end
