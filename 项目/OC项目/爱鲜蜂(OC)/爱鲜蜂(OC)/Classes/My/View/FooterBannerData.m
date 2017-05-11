//
//  FooterBannerData.m
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "FooterBannerData.h"

@implementation FooterBannerData

+ (void)loadFootBannerData:(CompleteBlock)comple{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"footerBanner" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    FooterBannerData *footerData = [FooterBannerData mj_objectWithKeyValues:dict];
    comple(footerData.data,nil);
}

+ (NSDictionary *)mj_objectClassInArray{
    return @{
             @"data": NSStringFromClass([Activity class])
             };
}

@end
