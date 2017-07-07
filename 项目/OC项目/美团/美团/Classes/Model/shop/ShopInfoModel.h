//
//  ShopInfoModel.h
//  美团
//
//  Created by 金亮齐 on 2017/7/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopInfoModel : NSObject

@property(nonatomic, strong) NSNumber *id;
@property(nonatomic, strong) NSString *imgurl;
@property(nonatomic, strong) NSString *mname;
@property(nonatomic, strong) NSString *title;


@property(nonatomic, strong) NSNumber *price;
@property(nonatomic, strong) NSNumber *value;//原价

@property(nonatomic, strong) NSNumber *solds;//已售

@end
