//
//  UITableViewCell+FFAdd.h
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFViewModel.h"

@interface UITableViewCell (FFAdd)
@property (nonatomic, strong) FFViewModel *cellModel;
@property (nonatomic, strong) NSIndexPath *indexPath;
@end
