//
//  UIBarButtonItem+Extension.h
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,ItemButtonType) {
    LeftItemButton,
    RightItemButton
};

@interface UIBarButtonItem (Button)

+ (instancetype)barButtonItem:(NSString *)title image:(NSString *)image target:(id)target action:(SEL)action type:(ItemButtonType)type;


@end

