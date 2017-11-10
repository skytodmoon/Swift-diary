//
//  bannerInfoModel.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "BaseModel.h"

@interface bannerInfoModel : BaseModel

@property (nonatomic,strong) NSNumber *ID;

@property (nonatomic,copy) NSString *pic;

@property (nonatomic,strong) NSNumber *target_id;

@property (nonatomic,strong) NSNumber *type;

@end
