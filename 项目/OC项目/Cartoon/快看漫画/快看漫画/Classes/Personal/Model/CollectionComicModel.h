//
//  CollectionComicModel.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "BaseModel.h"
#import "topicModel.h"

@interface CollectionComicModel : BaseModel

@property (nonatomic,copy)      NSString *cover_image_url;

@property (nonatomic,strong)    NSNumber *created_at;

@property (nonatomic,strong)    NSNumber *ID;

@property (nonatomic,copy)      NSString *status;

@property (nonatomic,copy)      NSString *title;

@property (nonatomic,strong)    topicModel *topic;

@property (nonatomic,strong)    NSNumber *updated_at;

@property (nonatomic,copy)      NSString *url;
@end
