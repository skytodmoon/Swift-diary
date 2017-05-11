//
//  HomeHeadData.m
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "HomeHeadData.h"

@implementation HomeHeadData


+ (void)loadHeadData:(CompleteBlock)complete {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"首页热卖" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    HomeHeadData *homeHeadData = [HomeHeadData mj_objectWithKeyValues:json[@"data"]];
    homeHeadData.focus = (ActInfo *)homeHeadData.act_info[0] ;
    homeHeadData.icon = (ActInfo *)homeHeadData.act_info[1];
    homeHeadData.headline = (ActInfo *)homeHeadData.act_info[2];
    homeHeadData.brand = (ActInfo *)homeHeadData.act_info[3];
    homeHeadData.scene = (ActInfo *)homeHeadData.act_info[4];
    homeHeadData.category = (ActInfo *)homeHeadData.act_info[5];
    complete(homeHeadData,nil);
}

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"act_info":NSStringFromClass([ActInfo class])};
}
@end

@implementation ActInfo

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"act_rows":NSStringFromClass([ActRow class])};
}

@end

@implementation ActRow



@end

@implementation HeadlineDetail



@end


@implementation CategoryDetail

+(NSDictionary *)mj_objectClassInArray {
    return @{@"goods":NSStringFromClass([Goods class])};
}

@end
