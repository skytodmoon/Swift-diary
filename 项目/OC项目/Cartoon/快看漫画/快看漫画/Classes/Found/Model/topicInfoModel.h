//
//  topicInfoModel.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "BaseModel.h"
#import "topicModel.h"
#import "bannerInfoModel.h"

@interface topicInfoModel : BaseModel

@property (nonatomic,copy) NSString *action;

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSArray *topics;

@property (nonatomic,copy) NSArray *banners;

@property (nonatomic,strong) NSNumber *type;

@end
