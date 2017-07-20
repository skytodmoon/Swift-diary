//
//  CityModal.m
//  美团iPad
//
//  Created by 金亮齐 on 2017/7/20.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "CityModal.h"
#import "RegionModal.h"

@implementation CityModal

- (NSDictionary *)objectClassInArray
{
    return @{@"regions" : [RegionModal class]};
}

@end
