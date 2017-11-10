//
//  AuthorInfoDetailHeadView.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AuthorInfoModel;

static CGFloat const AuthorInfoDetailHeadViewHeight = 250.0f;

@interface AuthorInfoDetailHeadView : UIView

@property (nonatomic,strong) AuthorInfoModel *model;

+ (instancetype)makeAuthorInfoDetailHeadView;


@end
