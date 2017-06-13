//
//  GIFItem.h
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GIFItem : NSObject

/************ gif ************/

@property (nonatomic,strong) NSArray *download_url;

@property (nonatomic,strong) NSArray *gif_thumbnail;

@property (nonatomic,assign) NSInteger height;

@property (nonatomic,strong) NSArray *images;

@property (nonatomic,assign) NSInteger width;


@end
