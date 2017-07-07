//
//  MerDetailModel.h
//  美团
//
//  Created by 金亮齐 on 2017/7/4.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MerDetailModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *avgScore;//星星
@property (nonatomic, strong) NSNumber *avgPrice;//人均
@property (nonatomic, strong) NSString *frontImg;//背景图
@property (nonatomic, strong) NSString *addr;//地址

@property (nonatomic, strong) NSString *phone;//电话
@property (nonatomic, strong) NSString *featureMenus;//推荐菜

@end
