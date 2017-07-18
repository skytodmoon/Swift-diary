//
//  MAAroundModel.h
//  Created by 金亮齐 on 2017/7/17.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAAroundModel : NSObject

@property(nonatomic, strong) NSString *mname;//标题
@property(nonatomic, strong) NSNumber *price;//价格
@property(nonatomic, strong) NSString *imgurl;//图片
@property(nonatomic, strong) NSMutableArray *rdplocs;//坐标等

@end
