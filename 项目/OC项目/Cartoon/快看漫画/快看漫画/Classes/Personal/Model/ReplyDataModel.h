//
//  ReplyDataModel.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "BaseModel.h"
#import "userModel.h"


@interface TargetCommentModel : BaseModel

@property (nonatomic,copy)   NSString *content;

@property (nonatomic,strong) NSNumber *ID;


@end


@interface TargetComicModel : BaseModel

@property (nonatomic,copy)   NSString *cover_image_url;

@property (nonatomic,strong) NSNumber *ID;

@property (nonatomic,copy)   NSString *title;

@property (nonatomic,copy)   NSString *topic_title;


@end

@interface ReplyCommentsModel : BaseModel

@property (nonatomic,strong) NSNumber *accused_count;

@property (nonatomic,strong) NSNumber *comic_id;

@property (nonatomic,copy)   NSString *content;

@property (nonatomic,strong) NSNumber *created_at;

@property (nonatomic,strong) NSNumber *flag;

@property (nonatomic,strong) NSNumber *ID;

@property (nonatomic,strong) NSNumber *likes_count;

@property (nonatomic,strong) NSNumber *replied_user_id;

@property (nonatomic,strong) TargetComicModel   *target_comic;

@property (nonatomic,strong) TargetCommentModel *target_comment;

@property (nonatomic,strong) userModel *user;

@end

@interface ReplyDataModel : BaseModel

@property (nonatomic,strong) NSMutableArray *comments;

@property (nonatomic,strong) NSNumber *since;

@end
