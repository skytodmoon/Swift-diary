//
//  CommentBottomView.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UserInfoManager.h"

@interface CommentBottomView : UIView

@property (nonatomic,assign) commentDataType dataType;

@property (nonatomic,strong) NSNumber *commentID;

@property (nonatomic,assign) BOOL beginComment;

@property (nonatomic,assign) NSInteger recommend_count;

+ (instancetype)commentBottomView;

@end
