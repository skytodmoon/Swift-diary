//
//  MineModel.h
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/14.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MineModel : NSObject
@property (nonatomic,copy)NSString *status;
@property (nonatomic,copy)NSString *info;
@property (nonatomic,copy)NSString *times;
@property (nonatomic,copy)NSString *ra_referer;
@property (nonatomic,strong)NSDictionary * data;
@property (nonatomic,strong)NSDictionary * extra;
@end
