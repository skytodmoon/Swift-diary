//
//  FeedsDataModel.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "BaseModel.h"
#import "userModel.h"


@interface FeedsContentModel : BaseModel

@property (nonatomic,copy)   NSString *identity;

@property (nonatomic,strong) NSArray *images;

@property (nonatomic,copy)   NSString *image_base;

@property (nonatomic,copy)   NSString *text;

@end

@interface FeedsModel : BaseModel

@property (nonatomic,strong) NSNumber *likes_count;

@property (nonatomic,strong) NSNumber *updated_at;

@property (nonatomic,strong) NSNumber *comments_count;

@property (nonatomic,copy)   NSString *share_url;

@property (nonatomic,assign) BOOL following;

@property (nonatomic,strong) NSNumber *created_at;

@property (nonatomic,strong) NSNumber *shared_count;

@property (nonatomic,strong) NSNumber *feed_type;

@property (nonatomic,strong) userModel *user;

@property (nonatomic,strong) FeedsContentModel *content;

@property (nonatomic,copy)   NSArray<NSURL *> *photoImages; //原图

@property (nonatomic,copy)   NSArray<NSURL *> *thumbImages; //缩略图

@property (nonatomic,strong) NSNumber *feed_id;

@property (nonatomic,assign) BOOL is_liked;

@end

@interface FeedsDataModel : BaseModel

@property (nonatomic,strong) NSNumber *current;

@property (nonatomic,strong) NSNumber *pub_feed;

@property (nonatomic,strong) NSMutableArray  *feeds;

@property (nonatomic,strong) NSNumber *since;

@end
