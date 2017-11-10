//
//  AuthorStatusDetailViewController.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "BaseViewController.h"

@class FeedsModel;

@interface AuthorStatusDetailViewController : BaseViewController

@property (nonatomic,strong) FeedsModel *feed_Model;

@property (nonatomic,assign) CGFloat statusCellHeight;


- (instancetype)initWithFeedsModel:(FeedsModel *)model WithCellHeight:(CGFloat)cellheight;

@end
