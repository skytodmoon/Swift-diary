//
//  CommentSendView.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@class userModel;

@interface CommentSendView : UIView

@property (nonatomic,copy) void (^sendMessage)(NSString *message);

+ (instancetype)makeCommentSendView;

- (void)clearText;

- (void)setPlaceText:(NSString *)placeText;

- (void)replyWithUserModel:(userModel *)user;

@end
