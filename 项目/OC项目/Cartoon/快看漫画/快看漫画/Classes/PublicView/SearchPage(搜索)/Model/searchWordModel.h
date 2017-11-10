//
//  searchWordModel.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "BaseModel.h"
#import "userModel.h"


@interface searchWordModel : BaseModel


@property (nonatomic,strong) NSNumber *comics_count;

@property (nonatomic,strong) NSNumber *comments_count;

@property (nonatomic,assign) BOOL is_favourite;

@property (nonatomic,copy)   NSString *cover_image_url;

@property (nonatomic,copy)   NSString *desc;

@property (nonatomic,copy)   NSString *discover_image_url;

@property (nonatomic,copy)   NSString *title;

@property (nonatomic,copy)   NSString *vertical_image_url;

@property (nonatomic,strong) userModel *user;

@property (nonatomic,strong) NSNumber *created_at;

@property (nonatomic,strong) NSNumber *ID;

@property (nonatomic,strong) NSNumber *label_id;

@property (nonatomic,strong) NSNumber *likes_count;

@property (nonatomic,strong) NSNumber *order;

@property (nonatomic,strong) NSNumber *updated_at;

@end
