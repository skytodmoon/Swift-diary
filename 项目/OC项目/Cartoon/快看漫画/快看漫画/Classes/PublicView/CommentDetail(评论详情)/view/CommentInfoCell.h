//
//  CommentInfoCell.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CommentsModel;

static NSString * const commentInfoCellName = @"CommentInfoCellIdentifier";

static NSString * const hotComicsCommentRequestUrlFormat =
@"http://api.kuaikanmanhua.com/v1/comics/%@/comments/%zd?order=score";

static NSString * const newComicsCommentRequestUrlFormat =
@"http://api.kuaikanmanhua.com/v1/comics/%@/comments/%zd?";

static NSString * const newFeedsCommentRequestUrlFormat =
@"http://api.kuaikanmanhua.com/v1/comments/feed/%@/order/time?offset=%zd";

static NSString * const hotFeedsCommentRequestUrlFormat =
@"http://api.kuaikanmanhua.com/v1/comments/feed/%@/order/score?offset=%zd";

@interface CommentInfoCell : UITableViewCell

@property (nonatomic,strong) CommentsModel *commentsModel;


+ (instancetype)makeCommentInfoCell;

@end
