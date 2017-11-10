//
//  bannersModel.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "BaseModel.h"

@interface bannersModel : BaseModel

@property (nonatomic,strong) NSNumber *ID;

@property (nonatomic,strong) NSNumber *target_id;

@property (nonatomic,copy) NSString *pic;

@property (nonatomic,copy) NSString *target_title;

@property (nonatomic,strong) NSNumber *type;

@end
