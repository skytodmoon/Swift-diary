//
//  UIBarButtonItem+Extension.h
//  美团iPad
//
//  Created by 金亮齐 on 2017/7/19.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (instancetype)itemWithImageName:(NSString *)name highImageName:(NSString *)HName target:(id)target action:(SEL)action;

@end
