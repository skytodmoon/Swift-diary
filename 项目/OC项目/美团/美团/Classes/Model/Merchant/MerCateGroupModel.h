//
//  MerCateGroupModel.h
//  美团
//
//  Created by 金亮齐 on 2017/7/3.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MerCateGroupModel : NSObject

@property(nonatomic, strong) NSNumber *id;
@property(nonatomic, strong) NSNumber *index;
@property(nonatomic, strong) NSNumber *parentID;
@property(nonatomic, strong) NSNumber *count;
@property(nonatomic, strong) NSString *name;


@property(nonatomic, strong) NSMutableArray *list;

@end
