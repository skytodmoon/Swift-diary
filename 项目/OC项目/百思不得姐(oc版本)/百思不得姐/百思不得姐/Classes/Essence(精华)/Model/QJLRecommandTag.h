//
//  QJLRecommandTag.h
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QJLRecommandTag : NSObject

@property (nonatomic, copy) NSString *image_list;

@property (nonatomic, copy) NSString *theme_id;

@property (nonatomic, copy) NSString *theme_name;

@property (nonatomic, assign) NSInteger is_sub;

@property (nonatomic, assign) NSInteger is_default;

@property (nonatomic, assign) NSInteger sub_number;

@end
