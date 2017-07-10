//
//  DisTopicModel.h
//  美团
//
//  Created by 金亮齐 on 2017/7/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DisTopicModel : NSObject
@property(nonatomic, strong) NSNumber *id;
@property(nonatomic, strong) NSMutableDictionary *share;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *rule;
@property(nonatomic, strong) NSString *imageurl;
@end
