//
//  CommentDetailModel.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "BaseModel.h"

@interface CommentDetailModel : BaseModel

@property (nonatomic,strong) NSMutableArray *comments;

@property (nonatomic,strong) NSNumber *since;

@end
