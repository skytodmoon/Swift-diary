//
//  UIColor+Hex.h
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

#ifndef UIColorHex
#define UIColorHex(_hex_) [UIColor colorWithHexString:((__bridge NSString *)CFSTR(#_hex_))]
#endif

+ (instancetype)colorWithHexString:(NSString *)hexStr;

@end
