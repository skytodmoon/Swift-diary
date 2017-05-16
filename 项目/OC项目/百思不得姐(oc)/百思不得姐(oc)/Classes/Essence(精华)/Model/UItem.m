//
//  UItem.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "UItem.h"
#import <MJExtension/MJExtension.h>
@implementation UItem
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"GIFdownload_url" : @"download_url",
             };
}
@end
