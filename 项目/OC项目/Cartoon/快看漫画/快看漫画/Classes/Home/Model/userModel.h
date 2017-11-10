//
//  userModel.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"


static NSString * const reg_Type_Author = @"author";

@interface userModel : BaseModel

@property (nonatomic,copy)   NSString *avatar_url;

@property (nonatomic,copy)   NSString *nickname;

@property (nonatomic,strong) NSNumber *ID;

@property (nonatomic,copy)   NSString *reg_type;

@end
