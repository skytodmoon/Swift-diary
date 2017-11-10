//
//  comicsModel.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "BaseModel.h"

#import "bannerInfoModel.h"
#import "topicModel.h"


@interface comicsModel : BaseModel

@property (nonatomic,strong) bannerInfoModel *banner_info;

@property (nonatomic,strong) NSNumber *comments_count;

@property (nonatomic,copy)   NSString *cover_image_url;

@property (nonatomic,strong) NSNumber *created_at;

@property (nonatomic,strong) NSNumber *ID;

@property (nonatomic,strong) NSArray *images;

@property (nonatomic) BOOL is_favourite;

@property (nonatomic) BOOL is_liked;

@property (nonatomic,strong) NSNumber *likes_count;

@property (nonatomic,strong) NSNumber *next_comic_id;

@property (nonatomic,strong) NSNumber *previous_comic_id;

@property (nonatomic,strong) NSNumber *recommend_count;

@property (nonatomic,strong) NSNumber *updated_at;

@property (nonatomic,copy) NSString *status;

@property (nonatomic,copy) NSString *title;

@property (nonatomic,strong) topicModel *topic;

@property (nonatomic,copy) NSString *url;

@end
