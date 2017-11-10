//
//  CartonnWordsModel.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "BaseModel.h"

@interface CartonnWordsModel : BaseModel

@property (nonatomic,copy) NSString *cover_image_url;

@property (nonatomic,copy) NSString *status;

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *url;

@property (nonatomic,strong) NSNumber *created_at;

@property (nonatomic,strong) NSNumber *ID;

@property (nonatomic,strong) NSNumber *likes_count;

@property (nonatomic,strong) NSNumber *topic_id;

@property (nonatomic,strong) NSNumber *updated_at;

@end
