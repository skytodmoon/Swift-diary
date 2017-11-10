//
//  CommentsModel.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "userModel.h"


@interface CommentsModel : BaseModel

@property (nonatomic,strong) NSNumber *comic_id;

@property (nonatomic,strong) NSNumber *created_at;

@property (nonatomic,strong) NSNumber *ID;

@property (nonatomic,copy)   NSString *content;

@property (nonatomic)        BOOL is_liked;

@property (nonatomic,strong) NSNumber *likes_count;

@property (nonatomic,strong) NSNumber *replied_comment_id;

@property (nonatomic,strong) NSNumber *replied_user_id;

@property (nonatomic,strong) userModel *user;

@end
