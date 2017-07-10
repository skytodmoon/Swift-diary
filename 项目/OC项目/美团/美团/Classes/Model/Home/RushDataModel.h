//
//  RushDataModel.h
//  美团
//
//  Created by 金亮齐 on 2017/7/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RushDataModel : NSObject

@property(nonatomic, strong) NSNumber *id;
@property(nonatomic, strong) NSMutableArray *share;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSNumber *start;
@property(nonatomic, strong) NSNumber *listJumpToTouch;

@property(nonatomic, strong) NSNumber *type;
@property(nonatomic, strong) NSString *descBefore;
@property(nonatomic, strong) NSMutableArray *deals;
@property(nonatomic, strong) NSNumber *end;
@property(nonatomic, strong) NSString *touchUrlForList;

@property(nonatomic, strong) NSString *descIn;
@property(nonatomic, strong) NSString *descAfter;

@end
